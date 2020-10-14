//
//  FriendTableViewCell.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 12.10.2020.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendAvatarImage: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendAgeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
