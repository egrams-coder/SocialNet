//
//  CommunityTableViewCell.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 14.10.2020.
//

import UIKit

class CommunityTableViewCell: UITableViewCell {

    @IBOutlet weak var communityImage: UIImageView!
    @IBOutlet weak var communityLabelName: UILabel!
    @IBOutlet weak var communityLabelDescription: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
