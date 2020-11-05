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
}
