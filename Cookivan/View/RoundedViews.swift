//
//  RoundedViews.swift
//  Cookivan
//
//  Created by Angelina on 7/15/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 24
    }
}

class ClearBGButton: RoundedButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.borderColor = AppColors.Red.cgColor
    }
}

class RoundedTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.cornerRadius = 24
        layer.borderWidth = 1
        layer.borderColor = AppColors.Grey.cgColor
        // MARK: - makes space for the text entering from the left border
        layer.sublayerTransform = CATransform3DMakeTranslation(19, 0, 10)
    }
}

class GreyBorderRoundedTextField: RoundedTextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = AppColors.GreyTxtFieldBorder.cgColor
    }
}

class RoundedShadowView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.shadowColor = AppColors.GreyShadow.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
    }
}
