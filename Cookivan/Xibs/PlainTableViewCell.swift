//
//  PlainTableViewCell.swift
//  Cookivan
//
//  Created by Angelina on 7/30/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class PlainTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.applyshadowWithCorner(containerView: containerView, cornerRadious: 10)
    }

}
