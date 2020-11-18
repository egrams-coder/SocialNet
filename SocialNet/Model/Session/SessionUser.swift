//
//  SessionUser.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 18.11.2020.
//

import Foundation
import UIKit

class Session {
    
    static let instance = Session()
    private init(){}
    
    var token: String = ""
    var idUser: Int = 0
}
