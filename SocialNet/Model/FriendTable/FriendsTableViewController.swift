//
//  FriendsTableViewController.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 06.10.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController, UISearchBarDelegate {

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var friendList: [Friends] = [
        Friends(avatar: ["1", "2", "3", "4"], nameHeading: "Екатерина", nameSubtitle: "27 лет"),
        Friends(avatar: ["2", "1", "2", "3", "4"], nameHeading: "Роман", nameSubtitle: "32 года"),
        Friends(avatar: ["3", "1", "2", "3", "4"], nameHeading: "Марина", nameSubtitle: "58 лет"),
        Friends(avatar: ["4", "1", "2", "3", "4"], nameHeading: "Михаил", nameSubtitle: "5 лет"),
        Friends(avatar: ["5", "1", "2", "3", "4"], nameHeading: "Егор", nameSubtitle: "6 месяцев")
        ]
    
    var friendsIndex: [String] = []
    var filteredData: [Friends]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "UniversalTableViewCell", bundle: nil), forCellReuseIdentifier: "universalCell")
        
        indexCreat()
        
        searchBar.delegate = self
        filteredData = friendList

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsIndex.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let items = filteredData.filter { (friendList) -> Bool in
            friendsIndex[section] == String(friendList.nameHeading.first!)
        }
        
        return items.count
    }
    
    // Настройка верхних секций с первыми буквами имен
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        view.backgroundColor = .systemGray5
        let label = UILabel(frame: CGRect(x: 35, y: 0, width: 50, height: 30))
        label.text = String(friendsIndex[section])
        view.addSubview(label)

        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "universalCell", for: indexPath) as! UniversalTableViewCell
        
        let items = filteredData.filter { (friendList) -> Bool in
            friendsIndex[indexPath.section] == String(friendList.nameHeading.first!)
        }
        cell.setupFriend(item: items[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // переход с таблицы на коллекцию с помощью сигвея
        //performSegue(withIdentifier: "homePage", sender: nil)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FriendsCollectionViewController") as! FriendsCollectionViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    
        vc.friend = friendList[indexPath.row]
    }
    
    // создаем навигацию по именам с помощью маленьких вертикальных букв
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsIndex
    }
    
    // Перебераем в массиве имен -> выбераем первые буквы и кладем в новый массив
    func indexCreat() {
        
        var tempIndex: [String] = []
        for item in friendList {
            tempIndex.append(String(item.nameHeading.first!))
        }
        friendsIndex = Array(Set(tempIndex)).sorted()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == "" {
            filteredData = friendList
        } else {
            for search in friendList {
                if search.nameHeading.contains(searchText) {
                    filteredData.append(search)
                }
            }
            
        }
        self.tableView.reloadData()
    }
}
