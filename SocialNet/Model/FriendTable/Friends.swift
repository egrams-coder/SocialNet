//
//  Friends.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 15.10.2020.
//

import Foundation


protocol UniversalCellProtocol {
    var avatar: String {get set}
    var nameHeading: String { get set }
    var nameSubtitle: String { get set }
}

struct Friends: UniversalCellProtocol {
    var avatar: String
    var nameHeading: String
    var nameSubtitle: String
}

struct FriendsFoto {
    var friendFoto: String
}
