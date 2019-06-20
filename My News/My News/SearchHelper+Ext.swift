//
//  SearchHelper+Ext.swift
//  My News
//
//  Created by Israel Manzo on 3/24/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

//MARK: - Search extension controller
extension HomeController: UISearchResultsUpdating {
    
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
    
    @available(iOS 8.0, *)
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentSearch(searchext: searchController.searchBar.text!)
    }
    
    // MARK: Refresh controller functions
    func doSomething() {
        timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(HomeController.endWork), userInfo: nil, repeats: true)
    }
    
    @objc func endWork(){
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


