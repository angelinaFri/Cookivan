//
//  RecipesCollectionViewCell.swift
//  Cookivan
//
//  Created by Angelina on 7/29/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class RecipesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recipesCollectionViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recipesCollectionViewCell.layer.cornerRadius = 10
        self.layer.cornerRadius = 10
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = #colorLiteral(red: 0.168627451, green: 0.1137254902, blue: 0.1215686275, alpha: 1)
        self.layer.shadowOffset =  CGSize(width: 1, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shouldRasterize = true
    }

}
