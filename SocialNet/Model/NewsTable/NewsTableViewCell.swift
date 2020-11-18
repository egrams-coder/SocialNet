//
//  NewsTableViewCell.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 04.11.2020.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarViewNews: CustomAvatar!
    @IBOutlet weak var nameLabelNews: UILabel!
    @IBOutlet weak var dataPublicNews: UILabel!
    @IBOutlet weak var fotoLentaNews: UIImageView!
    @IBOutlet weak var likeFriendButNews: UIButton!
    @IBOutlet weak var likeFriendLabelNews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupNews(item: News)  {
       // friendAvatarImage.image = UIImage(named: item.avatar)
        avatarViewNews.imageView.image = UIImage(named: item.avatar.first!)
        nameLabelNews.text = item.nameHeading
        dataPublicNews.text = item.nameSubtitle
        fotoLentaNews.image = UIImage(named: item.fotoLenta)
        
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
        
        self.avatarViewNews.layer.add(animation, forKey: nil)
    }
    
    @IBAction func likeFriendButNews(_ sender: UIButton) {
        if likeFriendButNews.tag == 0 {
            
            likeFriendButNews.setImage(UIImage(named: "likeGreay"), for: .normal)
            likeFriendButNews.tag = 1
            likeFriendLabelNews.text = "0"
            likeFriendLabelNews.textColor = .systemGray
        } else {
            
            likeFriendButNews.setImage(UIImage(named: "likeRed"), for: .normal)
            likeFriendButNews.tag = 0
            likeFriendLabelNews.text = "1"
            likeFriendLabelNews.textColor = .systemRed
            animateButtonLike()
        }
    }
    
    // Анимация лайков
    func animateButtonLike() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 1.5
        animation.duration = 2
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.likeFriendButNews.layer.add(animation, forKey: nil)
    }
}
