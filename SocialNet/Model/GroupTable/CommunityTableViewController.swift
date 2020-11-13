//
//  CommunityTableViewController.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 14.10.2020.
//

import UIKit

class CommunityTableViewController: UITableViewController, UISearchBarDelegate {

    
    var groupList: [Group] {
        get {
            return GroupDataBase.instance.itemGroup.filter { $0.added == true }
        }
    }
    
    var filteredSearch: [Group]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "universalCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
//        if groupList.count > 0 {
//            self.tableView.reloadData()
//        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universalCell", for: indexPath) as! UniversalTableViewCell
        
        cell.setupGroup(item: groupList[indexPath.row])
        return cell
    }
    
    // Кнопки удаления по свайпу
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            print("delete")
            if groupList.count > 0 && indexPath.row < groupList.count {
                GroupDataBase.instance.itemGroup[indexPath.row].added = false
                GroupDataBase.instance.change(group: groupList[indexPath.row])
                
                
                tableView.deleteRows(at: [indexPath], with: .left)
            }
            
        }
    }
    
}
