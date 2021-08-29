//
//  SettingsTableViewCell.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/29.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    @IBOutlet var leftImageView: UIImageView!
    @IBOutlet var titleLableView: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
