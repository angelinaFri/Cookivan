//
//  RegistrationVC.swift
//  Cookivan
//
//  Created by Angelina on 7/15/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class RegistrationVC: UIViewController {

    @IBOutlet weak var usernameTxt: RoundedTextField!
    @IBOutlet weak var emailTxt: RoundedTextField!
    @IBOutlet weak var passwordTxt: RoundedTextField!
    @IBOutlet weak var confirmPassTxt: RoundedTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImg: UIImageView!
    @IBOutlet weak var confirmPassCheckImg: UIImageView!
    private var storage = FireBaseStorage()

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
        guard let passTxt = passwordTxt.text else {
            return
        }
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
            simpleAlert(title: "Пожалуйста, заполните все поля.", msg: "")
            return
        }

        // MARK:- Password matching validation
        guard let confirmPass = confirmPassTxt.text, confirmPass == password else {
            simpleAlert(title: "Пароли не совпадают", msg: "")
            return
        }
        activityIndicator.startAnimating()
        // MARK:- Manually creating user and link it with anonymous one /that was logged in already
        self.storage.createOrLinkUser(username: username, email: email, password: password) { [weak self] error in
            self?.activityIndicator.stopAnimating()
            if let error = error {
                debugPrint(error)
                self?.handleFireAuthError(error: error)
            }
//             TODO: implement some logic
        }
    }

//    func createFirestoreUser(user: User) {
//        let newUserRef = Firestore.firestore().collection("users").document(user.id)
//        let data = User.modelToData(user: user)
//        newUserRef.setData(data) { (error) in
//            if let error = error {
//                Auth.auth().handleFireAuthError(error: error, vc: self)
//                debugPrint("Unable to upload new user document \(error.localizedDescription)")
//            } else {
//                self.dismiss(animated: true, completion: nil)
//            }
//            self.activityIndicator.stopAnimating()
//        }
//    }
}
