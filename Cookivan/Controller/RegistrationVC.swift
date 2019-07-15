//
//  RegistrationVC.swift
//  Cookivan
//
//  Created by Angelina on 7/15/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        backBarButtonItemSetup()

        // Do any additional setup after loading the view.
    }
    
    func backBarButtonItemSetup() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "left_arrow")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "left_arrow")
        navigationController?.navigationBar.tintColor = AppColors.Grey
        navigationController?.navigationBar.topItem?.title = ""
        // TODO: Move arrow from left side
    }


}
