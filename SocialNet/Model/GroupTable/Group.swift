//
//  Group.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 15.10.2020.
//

import Foundation

struct Group: UniversalCellProtocol {
    var avatar: [String]
    var nameHeading: String
    var nameSubtitle: String
    var added: Bool
}

class GroupDataBase {
    
    static let instance = GroupDataBase()
    private init() {}
    
    var item: [Group] = [
        Group(avatar: ["1.1"], nameHeading: "Музыкальная группа", nameSubtitle: "Для ценителей настоящей музыки", added: false),
        Group(avatar: ["1.3"], nameHeading: "Стройка и ремонт", nameSubtitle: "Поможем построить Тяп- Ляп", added: false),
        Group(avatar: ["1.2"], nameHeading: "Автомобили и мотоциклы", nameSubtitle: "Прокачай свой тазик", added: true)
        ]
    func change(group: Group) {
        for i in 0..<item.count {
            if item[i].nameHeading == group.nameHeading  {
                item[i] = group
            } 
        }
    }
}
