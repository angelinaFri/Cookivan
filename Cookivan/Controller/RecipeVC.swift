//
//  RecipeVC.swift
//  Cookivan
//
//  Created by Angelina on 8/12/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class RecipeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navBarSetUp()

    }

    func navBarSetUp() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
}
