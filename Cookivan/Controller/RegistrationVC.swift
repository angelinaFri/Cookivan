//
//  RegistrationVC.swift
//  Cookivan
//
//  Created by Angelina on 7/15/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit
import Firebase

class RegistrationVC: UIViewController {

    @IBOutlet weak var usernameTxt: RoundedTextField!
    @IBOutlet weak var emailTxt: RoundedTextField!
    @IBOutlet weak var passwordTxt: RoundedTextField!
    @IBOutlet weak var confirmPassTxt: RoundedTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImg: UIImageView!
    @IBOutlet weak var confirmPassCheckImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        backBarButtonItemSetup()
        checkItemSwitch()

    }

    func checkItemSwitch() {
        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPassTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }

    @objc func textFieldDidChange(_ textField: RoundedTextField) {
        guard let passTxt = passwordTxt.text else { return }
        // when we have started typing in the confirm pass field.
        if textField == confirmPassTxt {
            passCheckImg.isHidden = false
            confirmPassCheckImg.isHidden = false
        } else {
            if passTxt.isEmpty {
                passCheckImg.isHidden = true
                confirmPassCheckImg.isHidden = true
                confirmPassTxt.text = ""
            }
        }
        // when the passwords match, the checkmarks turn green
        if passwordTxt.text == confirmPassTxt.text {
            passCheckImg.image = UIImage(named: AppImages.GreenCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.GreenCheck)
        } else {
            passCheckImg.image = UIImage(named: AppImages.RedCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.RedCheck)
        }
    }

    func backBarButtonItemSetup() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "left_arrow")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "left_arrow")
        navigationController?.navigationBar.tintColor = AppColors.Grey
        navigationController?.navigationBar.topItem?.title = ""
        // TODO: Move arrow from left side
    }


    @IBAction func registerClicked(_ sender: Any) {
        // MARK:- All fields are filled out validation
        guard let email = emailTxt.text, email.isNotEmpty,
            let username = usernameTxt.text, username.isNotEmpty,
            let password = passwordTxt.text, password.isNotEmpty else {
                simpleAlert(title: "Упс...Ошибка", msg: "Пожалуйста, заполните все поля.")
                return
        }


        // MARK:- Password matching validation
        guard let confirmPass = confirmPassTxt.text, confirmPass == password else {
            simpleAlert(title: "Упс...Ошибка", msg: "Пароли не совпадают.")
            return
        }
        activityIndicator.startAnimating()

        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                debugPrint(error)
                Auth.auth().handleFireAuthError(error: error, vc: self)
                return
            }
        }

        // MARK:- Manually creating user and link it with anonymous one /that was logged in already
        guard let authUser = Auth.auth().currentUser else { return }
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        authUser.link(with: credential) { (result, error) in
            if let error = error {
                debugPrint(error)
                Auth.auth().handleFireAuthError(error: error, vc: self)
                return
            }
            guard let firestoreUser = result?.user else { return }
            let applicationUser = User.init(id: firestoreUser.uid, email: email, username: username)
            self.createFirestoreUser(user: applicationUser)
        }
    }

    func createFirestoreUser(user: User) {
        let newUserRef = Firestore.firestore().collection("users").document(user.id)
        let data = User.modelToData(user: user)
        newUserRef.setData(data) { (error) in
            if let error = error {
                Auth.auth().handleFireAuthError(error: error, vc: self)
                debugPrint("Unable to upload new user document \(error.localizedDescription)")
            } else {
                self.dismiss(animated: true, completion: nil)
            }
            self.activityIndicator.stopAnimating()
        }

    }

}
