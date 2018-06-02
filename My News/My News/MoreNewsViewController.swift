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
    
    let refreshControl = UIRefreshControl()
    
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
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.font: UIFont(name:"Marker Felt", size:20.0)!, NSAttributedStringKey.foregroundColor:UIColor.white
        ]
        navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: - Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreNews" {
            let destinationVC = segue.destination as! MoreNewsWebViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            destinationVC.webSite = moreNews[row].url
        }
    }
}

// MARK: - Delegate Functions
extension MoreNewsViewController {
    
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
        
        // MARK: Date formatting - String to Date block
        let publishDate = moreNews[indexPath.row].publishedAt?.replacingOccurrences(of: "T", with: " ")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        
        //"2016-12-15T22:05:24Z"
        let date = dateFormatter.date(from: publishDate!)
        
        let date2 = Date()
        cell.dateLbl.text = date2.offset(from: date!) + " " + "ago."
        
        let imageNews = moreNews[indexPath.row]
        cell.imageUpdateCell(cellData: imageNews)
        
        return cell
    }
}

