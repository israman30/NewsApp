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
        filterNews = newsArticle.filter({ (car) -> Bool in
            return (car.description?.lowercased().contains(searchext.lowercased()))!
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
        //        searchBar.delegate = self
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl)
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name:"Marker Felt", size:20.0)!, NSForegroundColorAttributeName:UIColor.white]
        
    }

    
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
        
        let articles: NewsArticle
        
        if searchController.isActive && searchController.searchBar.text != "" {
            
            articles = filterNews[indexPath.row]
        } else {
            
            articles  = newsArticle[indexPath.row]
        }

        cell.titleLabel.text = articles.title
        cell.descriptionLabel.text = articles.description
        let newPhoto = articles
        cell.updateImageCell(cellData: newPhoto)
        
        
//        cell.timeLabel.text =
        
        let published = articles.publishedAt?.replacingOccurrences(of: "T", with: " ")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        
        let date = dateFormatter.date(from: published!)
        
        let date2 = Date()
        
        cell.timeLabel.text = date2.offset(from: date!) + " " + "ago"
  
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

//MARK: extension
extension ViewController: UISearchResultsUpdating {
    @available(iOS 8.0, *)
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentSearch(searchext: searchController.searchBar.text!)
    }
    
}

extension Date {
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: date, to: self).weekOfYear ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" } else { return "" }
        
    }
}

