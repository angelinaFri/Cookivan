//
//  MainContainerViewController.swift
//  Cookivan
//
//  Created by Angelina on 7/29/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    let mainRecipesController = MainRecipesVC()
    let weekRecipesController = WeekRecipesChildVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        add(mainRecipesController)
        add(weekRecipesController)
    }
}


extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}
