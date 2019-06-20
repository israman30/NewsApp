//
//  ViewController.swift
//  My News
//
//  Created by Israel Manzo on 1/15/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class HomeControlle: UIViewController {
    
    var newsArticle = [NewsArticle]()
    
    var closure = NewsModel()
    
    var refreshControl: UIRefreshControl!
    var timer: Timer!
    var isAnimating = false
    
    var filterNews:[NewsArticle] = []
    var searchController = UISearchController(searchResultsController: nil)
    
    var menuIsOpen = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var menu: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        slideMenu()
        setMainView()
        resfreshControllerSetUp()
        
        // MARK: - Closure: Articles Data
        closure.fetchData(with: {listArticles in
            self.newsArticle = listArticles!
            self.tableView.reloadData()
        })
    }
    
    // MARK: View Will Appear - Navigaton controller edit font and color text
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavController()
    }
    
    // MARK: Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToWebView" {
            let destinationVC = segue.destination as! WebViewViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            destinationVC.webSite = newsArticle[row].url
        }
    }
}




