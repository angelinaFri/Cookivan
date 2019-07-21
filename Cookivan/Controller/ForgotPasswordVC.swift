//
//  ForgotPasswordVC.swift
//  Cookivan
//
//  Created by Angelina on 7/18/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var emailTxt: GreyBorderRoundedTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func cancelClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        print("vc dissmissed")
    }

    @IBAction func resetPassClicked(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpty else {
            simpleAlert(title: "Пожалуйста, введите Email", msg: "")
            return
        }
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                debugPrint(error)
                self.handleFireAuthError(error: error)
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
}
