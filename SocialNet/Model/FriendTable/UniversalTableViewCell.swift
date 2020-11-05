//
//  UniversalTableViewCell.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 15.10.2020.
//

import UIKit

class UniversalTableViewCell: UITableViewCell {

    
    @IBOutlet weak var avatarView: CustomAvatar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setupFriend(item: Friends)  {
       // friendAvatarImage.image = UIImage(named: item.avatar)
        avatarView.imageView.image = UIImage(named: item.avatar.first!)
        nameLabel.text = item.nameHeading
        titleLabel.text = item.nameSubtitle
    }
    func setupGroup(item: Group)  {
       // friendAvatarImage.image = UIImage(named: item.avatar)
        avatarView.imageView.image = UIImage(named: item.avatar.first!)
        nameLabel.text = item.nameHeading
        titleLabel.text = item.nameSubtitle
    }
    
    
}
