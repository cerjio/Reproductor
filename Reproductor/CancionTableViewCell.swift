//
//  CancionTableViewCell.swift
//  Reproductor
//
//  Created by cerjio on 25/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import UIKit

class CancionTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
