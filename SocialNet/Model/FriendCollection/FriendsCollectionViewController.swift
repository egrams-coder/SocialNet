//
//  FriendsCollectionViewController.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 15.10.2020.
//

import UIKit

//private let reuseIdentifier = "Cell"

class FriendsCollectionViewController: UICollectionViewController {
    
    var friend: Friends?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "UniversalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "universalCollectionCell")
        
        guard let friend = friend else { return }
        navigationItem.title = friend.nameHeading
    }
   

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let friend = friend else { return 0 }
        return friend.avatar.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "universalCollectionCell", for: indexPath) as! UniversalCollectionViewCell
        
        cell.friendAvatarImage.image = UIImage(named: friend!.avatar[indexPath.item])
        
        return cell
    }

}
