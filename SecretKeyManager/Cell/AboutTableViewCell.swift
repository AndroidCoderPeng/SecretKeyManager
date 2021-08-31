//
//  AboutTableViewCell.swift
//  SecretKeyManager
//
//  Created by 203 on 2021/8/31.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    @IBOutlet var leftImageView: UIImageView!
    @IBOutlet var titleLableView: UILabel!
    @IBOutlet var rightLabelView: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
