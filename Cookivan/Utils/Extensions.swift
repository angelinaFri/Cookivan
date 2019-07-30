//
//  Extensions.swift
//  Cookivan
//
//  Created by Angelina on 7/16/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension String {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

extension UIViewController {
    func simpleAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
