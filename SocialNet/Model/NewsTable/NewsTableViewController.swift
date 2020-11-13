//
//  NewsTableViewController.swift
//  SocialNet
//
//  Created by Роман Евтюхин on 04.11.2020.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var newsArray: [News] = [News(avatar: ["1"], nameHeading: "Екатерина", nameSubtitle: "04.11.2020", fotoLenta: "1"),
                             News(avatar: ["2"], nameHeading: "Роман", nameSubtitle: "04.11.2020", fotoLenta: "2"),
                             News(avatar: ["3"], nameHeading: "Марина", nameSubtitle: "04.11.2020", fotoLenta: "3"),
                             News(avatar: ["4"], nameHeading: "Михаил", nameSubtitle: "12.11.2020", fotoLenta: "4"),
                             News(avatar: ["5"], nameHeading: "Егор", nameSubtitle: "04.11.2020", fotoLenta: "5")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsCell")

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        
        cell.setupNews(item: newsArray[indexPath.row])
        
        return cell
    }
    

}
