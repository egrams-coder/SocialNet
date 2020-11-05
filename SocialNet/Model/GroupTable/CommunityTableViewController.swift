//
//  CommunityTableViewController.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 14.10.2020.
//

import UIKit

class CommunityTableViewController: UITableViewController {

    var item: [Group] {
        get {
            return GroupDataBase.instance.item.filter { $0.added == true }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "universalCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if item.count > 0 {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universalCell", for: indexPath) as! UniversalTableViewCell
        
        cell.setupGroup(item: item[indexPath.row])
        return cell
    }
    
    // Кнопки удаления по свайпу
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        GroupDataBase.instance.item[indexPath.row].added = false
        
        if editingStyle == .delete {
            if item.count > 0 && indexPath.row < item.count {
                GroupDataBase.instance.change(group: item[indexPath.row])
                tableView.deleteRows(at: [indexPath], with: .left)
            }
        
        }
    }
}
