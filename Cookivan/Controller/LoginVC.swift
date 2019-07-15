//
//  ViewController.swift
//  Cookivan
//
//  Created by Angelina on 7/14/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxtField: RoundedTextField!
    @IBOutlet weak var passwordTxtField: RoundedTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationView()
        
        // Do any additional setup after loading the view.
    }

    // TODO:- check how to change status bar color

    func setupNavigationView() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
}

