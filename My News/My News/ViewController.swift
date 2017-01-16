//
//  ViewController.swift
//  My News
//
//  Created by Israel Manzo on 1/15/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    var newsArticle = [NewsArticle]()
    
    var closure = NewsModel()
    
    var refreshControl: UIRefreshControl!
    var timer: Timer!
    var isAnimating = false
    
//    var filterNews:[NewsArticle] = []
    var searchController: UISearchController!
    var resultsController = UITableViewController()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closure.fetchData(with: {listArticles in
            self.newsArticle = listArticles!
            self.tableView.reloadData()
        })
        // searchController
        searchController = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl)
        
        
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
//        self.filterNews.filter { (news:[NewsArticle]) -> Bool in
//            if (news as AnyObject).contains(self.searchController.searchBar.text!) { return true}
//            else {return false}
//        }
    }
    
    
    // MARK: Delegates functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        
        let articles = newsArticle[indexPath.row]
        
        cell.titleLabel.text = articles.title
        cell.timeLabel.text = articles.publishedAt
        cell.descriptionLabel.text = articles.description
        let newPhoto = articles
        cell.updateImageCell(cellData: newPhoto)
  
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToWebView" {
            let destinationVC = segue.destination as! WebViewViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            destinationVC.webSite = newsArticle[row].url
        }
    }
    
    func doSomething() {
        timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ViewController.endWork), userInfo: nil, repeats: true)
    }
    
    func endWork(){
        refreshControl.endRefreshing()
        timer.invalidate()
        timer = nil
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshControl.isRefreshing {
            if !isAnimating {
                doSomething()
            }
        }
    }
}

