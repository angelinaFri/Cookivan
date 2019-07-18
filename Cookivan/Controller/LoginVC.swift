//
//  ViewController.swift
//  Cookivan
//
//  Created by Angelina on 7/14/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit
import Firebase

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
        let vc = ForgotPasswordVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }

    @IBAction func loginClicked(_ sender: Any) {
        guard let email = emailTxtField.text, email.isNotEmpty,
            let password = passwordTxtField.text, password.isNotEmpty else {
                simpleAlert(title: "Упс...Ошибка", msg: "Пожалуйста, заполните все поля.")
                return
        }
        activityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
                Auth.auth().handleFireAuthError(error: error, vc: self)
                self.activityIndicator.stopAnimating()
                return
            }
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func guestClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }



    // TODO:- check how to change status bar color

    func setupNavigationView() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
}

