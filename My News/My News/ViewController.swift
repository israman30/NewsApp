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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    func filterContentSearch(searchext: String, scoope: String = "All"){
        filterNews = newsArticle.filter({ (news) -> Bool in
            return (news.description?.lowercased().contains(searchext.lowercased()))!
        })
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        closure.fetchData(with: {listArticles in
            self.newsArticle = listArticles!
            self.tableView.reloadData()
        })
        
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl)
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.barTintColor = UIColor.black
    }
    
    // MARK: Navigaton controller edit font and color text
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name:"Marker Felt", size:20.0)!, NSForegroundColorAttributeName:UIColor.white]
    }

    // MARK: Search bar function
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterNews = newsArticle.filter({ (articles) -> Bool in
            return (articles.title?.lowercased().contains(searchText.lowercased()))!
        })
        self.tableView.reloadData()
    }
    
    // MARK: Delegates functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive && searchController.searchBar.text != "" {
            return filterNews.count
        }
        return newsArticle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        
        // MARK: This block gives the degin to the table view cell
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 2.5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.clipsToBounds = true
        cell.layer.shadowOpacity = 0.23
        cell.layer.shadowRadius = 4

        let articles: NewsArticle
        
        if searchController.isActive && searchController.searchBar.text != "" {
            
            articles = filterNews[indexPath.row]
        } else {
            
            articles  = newsArticle[indexPath.row]
        }

        cell.titleLabel.text = articles.title
        cell.timeLabel.text = articles.publishedAt
        cell.descriptionLabel.text = articles.description
        let newPhoto = articles
        cell.updateImageCell(cellData: newPhoto)
  
        return cell
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
    
    // MARK: Refresh controller functions
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

//MARK: Search extension
extension ViewController: UISearchResultsUpdating {
    @available(iOS 8.0, *)
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentSearch(searchext: searchController.searchBar.text!)
    }
    
}



