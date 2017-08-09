//
//  MoreNewsViewController.swift
//  My News
//
//  Created by Israel Manzo on 8/8/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class MoreNewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var menu: UIBarButtonItem!
    
    var moreNews = [MoreNewsArticles]()
    
    var closure = MoreNewsModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        closure.fetchData { (article) in
            self.moreNews = article!
            self.tableView.reloadData()
        }
        
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        menu.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "More News"
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name:"Marker Felt", size:20.0)!, NSForegroundColorAttributeName:UIColor.white]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MoreNewsTableViewCell
        
        cell.layer.cornerRadius = 9
        cell.layer.borderWidth = 3.5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.clipsToBounds = true
        cell.layer.shadowOpacity = 0.23
        cell.layer.shadowRadius = 4
        
        cell.titleLbl.text = moreNews[indexPath.row].title
        cell.dateLbl.text = moreNews[indexPath.row].publishedAt
        
        let imageNews = moreNews[indexPath.row]
        cell.imageUpdateCell(cellData: imageNews)
        
        return cell
    }

}
