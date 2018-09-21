//
//  MoreNewsViewController.swift
//  My News
//
//  Created by Israel Manzo on 8/8/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class MoreNewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menu: UIBarButtonItem!
    
    var moreNews = [MoreNewsArticles]()
    var closure = MoreNewsModel()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        revealController()
        tableViewDelegates()

        closure.fetchData { (article) in
            self.moreNews = article!
            self.tableView.reloadData()
        }
    }
    
    func tableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpMoreNewsNavBar()
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




