//
//  ViewController.swift
//  My News
//
//  Created by Israel Manzo on 1/15/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
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
        
        // MARK: - Slide Menu block
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        menu.tintColor = .white
        
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        // MARK: - Closure: Articles Data
        closure.fetchData(with: {listArticles in
            self.newsArticle = listArticles!
            self.tableView.reloadData()
        })
        
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .black
        
        // Sub.MARK: - Create a Refresh Controller
        resfreshControllerSetUp()
        
    }
    
    private func resfreshControllerSetUp(){
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        refreshControl.backgroundColor = .black
        tableView.addSubview(refreshControl)
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.barTintColor = .black
    }
    
    // MARK: View Will Appear - Navigaton controller edit font and color text
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name:"Marker Felt", size:20.0)!, NSForegroundColorAttributeName:UIColor.white
        ]
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .white
    }

    // MARK: Search bar functions
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterNews = newsArticle.filter({ (articles) -> Bool in
            return (articles.title?.lowercased().contains(searchText.lowercased()))!
        })
        self.tableView.reloadData()
    }
    
    func filterContentSearch(searchext: String, scoope: String = "All"){
        filterNews = newsArticle.filter({ (news) -> Bool in
            return (news.description?.lowercased().contains(searchext.lowercased()))!
        })
        tableView.reloadData()
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



