//
//  SubConstantTableViewCell.swift
//  CWK
//
//  Created by Kumal Perera on 3/23/18.
//  Copyright © 2018 heisenberg. All rights reserved.
//

import UIKit

class SubConstantTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundPic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
