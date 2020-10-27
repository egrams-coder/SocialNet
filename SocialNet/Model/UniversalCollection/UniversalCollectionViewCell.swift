//
//  UniversalCollectionViewCell.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 26.10.2020.
//

import UIKit

class UniversalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendAvatarImage: UIImageView!
    @IBOutlet weak var likeFriendBut: UIButton!
    @IBOutlet weak var likeFriendLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func likeFriendBut(_ sender: UIButton) {
        if likeFriendBut.tag == 0 {
            
            likeFriendBut.setImage(UIImage(named: "likeGreay"), for: .normal)
            likeFriendBut.tag = 1
            likeFriendLabel.text = "0"
            likeFriendLabel.textColor = .systemGray
        } else {
            likeFriendBut.setImage(UIImage(named: "likeRed"), for: .normal)
            likeFriendBut.tag = 0
            likeFriendLabel.text = "1"
            likeFriendLabel.textColor = .systemRed
        }
    }
}
