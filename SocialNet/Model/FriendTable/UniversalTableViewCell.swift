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
    
    @IBAction func buttonAvatar(_ sender: Any) {
        animateButtonAvatar()
    }
    
    // Анимация аватарок
    func animateButtonAvatar() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 1.5
        animation.duration = 2
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.avatarView.layer.add(animation, forKey: nil)
    }
}
