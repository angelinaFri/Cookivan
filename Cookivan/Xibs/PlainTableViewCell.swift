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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
