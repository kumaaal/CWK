//
//  SubHistoryTableViewCell.swift
//  CWK
//
//  Created by Kumal Perera on 3/22/18.
//  Copyright © 2018 heisenberg. All rights reserved.
//

import UIKit

class SubHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
