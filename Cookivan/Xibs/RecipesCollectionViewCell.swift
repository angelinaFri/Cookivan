//
//  RecipesCollectionViewCell.swift
//  Cookivan
//
//  Created by Angelina on 7/29/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class RecipesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recipesCollectionViewCellImg: UIImageView!
    @IBOutlet weak var recipeTitleLbl: UILabel!
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        recipesCollectionViewCellImg.applyshadowWithCorner(containerView: containerView, cornerRadious: 10)

    }

}


//recipesCollectionViewCellImg.layer.cornerRadius = 10
//recipeTitleLbl.shadowColor = UIColor.clear
//self.layer.cornerRadius = 10
//self.layer.shadowOpacity = 0.3
//self.layer.shadowColor = #colorLiteral(red: 0.168627451, green: 0.1137254902, blue: 0.1215686275, alpha: 1)
//self.layer.shadowOffset =  CGSize(width: 1, height: 3)
//self.layer.shadowRadius = 3
//self.layer.shouldRasterize = true
