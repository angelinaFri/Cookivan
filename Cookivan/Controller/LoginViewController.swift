//
//  LoginViewController.swift
//  Cookivan
//
//  Created by Angelina on 7/14/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: RoundedTextField!
    @IBOutlet weak var passwordTextField: RoundedTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextFields()
    }

    @IBAction func forgotPassClicked(_ sender: UIButton) {
        let viewController = ForgotPasswordVC()
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .overCurrentContext
        present(viewController, animated: true, completion: nil)
    }

    @IBAction func loginClicked(_ sender: UIButton) {
        userSignin()
    }

    @IBAction func guestClicked(_ sender: UIButton) {
//        dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TabBarControllerSID")
        if viewController is MainRecipesVC {
            present(viewController, animated: true, completion: nil)
        }
    }

    func userSignin() {
        guard let email = self.emailTextField.text, email.isNotEmpty,
              let password = self.passwordTextField.text, password.isNotEmpty else {
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
        self.activityIndicator.startAnimating()
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

}

// MARK: - Private methods

extension LoginViewController {

    private func setupTextFields() {
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        let emailTextFieldPlaceholderString =
            NSLocalizedString("email", comment: "Placeholder text for email field on login screen")
        let emailTextFieldPlaceholder =
            NSAttributedString(string: emailTextFieldPlaceholderString, attributes: placeholderAttributes)
        self.emailTextField.attributedPlaceholder = emailTextFieldPlaceholder

        let passwordTextFieldPlaceholderString =
            NSLocalizedString("password", comment: "Placeholder text for password field on login screen")
        let passwordTextFieldPlaceholder =
            NSAttributedString(string: passwordTextFieldPlaceholderString, attributes: placeholderAttributes)
        self.passwordTextField.attributedPlaceholder = passwordTextFieldPlaceholder
    }

}
