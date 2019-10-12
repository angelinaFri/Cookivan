//
//  PlainTableViewCell.swift
//  Cookivan
//
//  Created by Angelina on 7/30/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class PlainTableViewCell: UITableViewCell {

    @IBOutlet weak var plainTableViewImg: UIImageView!
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        plainTableViewImg.applyshadowWithCorner(containerView: containerView, cornerRadious: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
