//
//  ViewController.swift
//  Cookivan
//
//  Created by Angelina on 7/14/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxtField: RoundedTextField!
    @IBOutlet weak var passwordTxtField: RoundedTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationView()

        // Do any additional setup after loading the view.
    }

    @IBAction func forgotPassClicked(_ sender: Any) {
        let viewController = ForgotPasswordVC()
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .overCurrentContext
        present(viewController, animated: true, completion: nil)
    }

    @IBAction func loginClicked(_ sender: Any) {
        userSignin()
    }

    @IBAction func guestClicked(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TabBarControllerSID")
        if viewController is MainRecipesVC {
            present(viewController, animated: true, completion: nil)
        }
    }

    func userSignin() {
        guard let email = emailTxtField.text, email.isNotEmpty,
              let password = passwordTxtField.text, password.isNotEmpty else {
            simpleAlert(title: "Пожалуйста, заполните все поля.", msg: "")
            return
        }
//        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
//            self.activityIndicator.stopAnimating()
//            if let error = error {
//                debugPrint(error.localizedDescription)
//                self.handleFireAuthError(error: error)
//                return
//            }
//            self.dismiss(animated: true, completion: nil)
//        }
        activityIndicator.startAnimating()
        FireBaseStorage().signIn(withEmail: email, password: password) { result in
            self.activityIndicator.stopAnimating()
            do {
                let user = try result.get()
                print(user)
                self.dismiss(animated: true, completion: nil)
            } catch {
                debugPrint(error.localizedDescription)
                self.handleFireAuthError(error: error)
            }
        }
    }

    func setupNavigationView() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
}
