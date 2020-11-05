//
//  SearchTableViewController.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 27.10.2020.
//

import UIKit

class SearchTableViewController: UITableViewController {

    //var item = GroupDataBase.instance.item.filter { $0.added == false }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Поиск"
        
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "universalCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    var item = GroupDataBase.instance.item.filter { $0.added == false }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universalCell", for: indexPath) as! UniversalTableViewCell
        
        cell.setupGroup(item: item[indexPath.row])
        return cell
    }
    
    // При нажатии на ячейку происходят действия
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        item[indexPath.row].added = true
        //функция change()
        GroupDataBase.instance.change(group: item[indexPath.row])
        // Переход на предыдущий экран
        self.navigationController?.popViewController(animated: true)
    }
}
