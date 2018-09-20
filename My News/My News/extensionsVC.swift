//
//  extensionsVC.swift
//  My News
//
//  Created by Israel Manzo on 3/24/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

//MARK: - Search extension controller
extension ViewController: UISearchResultsUpdating {
    
    @available(iOS 8.0, *)
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentSearch(searchext: searchController.searchBar.text!)
    }
    
    // MARK: Refresh controller functions
    func doSomething() {
        timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(ViewController.endWork), userInfo: nil, repeats: true)
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

extension ViewController {
    
    func setMainView(){
        view.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func resfreshControllerSetUp(){
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
}
