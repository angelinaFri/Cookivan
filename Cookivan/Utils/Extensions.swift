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

extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
//        containerView.layer.masksToBounds = true
        containerView.layer.shadowColor = #colorLiteral(red: 0.168627451, green: 0.1137254902, blue: 0.1215686275, alpha: 1)
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = CGSize(width: 1, height: 3)
        containerView.layer.shadowRadius = 3
        containerView.layer.cornerRadius = cornerRadious
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}



