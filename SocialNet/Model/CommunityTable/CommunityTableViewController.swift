//
//  CommunityTableViewController.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 14.10.2020.
//

import UIKit

class CommunityTableViewController: UITableViewController {
    
//    var group: [UniversalCellProtocol] = [
//        Group(avatar: "1.1", nameHeading: "Музыкальная группа", nameSubtitle: "Для ценителей настоящей музыки", added: true),
//        Group(avatar: "1.3", nameHeading: "Стройка и ремонт", nameSubtitle: "Поможем построить Тяп- Ляп"),
//        Group(avatar: "1.2", nameHeading: "Автомобили и мотоциклы", nameSubtitle: "Прокачай свой тазик"),
//        ]
//    var item = GroupDataBase.instance.item.filter {(i) -> Bool in
//        return i.added == true
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "universalCell")
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let item = GroupDataBase.instance.item.filter {(i) -> Bool in
            return i.added == true
        }
        return item.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universalCell", for: indexPath) as! UniversalTableViewCell
        
        let item = GroupDataBase.instance.item.filter {(i) -> Bool in
            return i.added == true
        }
        
        cell.setup(item: item[indexPath.row])
        
        return cell
    }
    
    
}
