//
//  SetMainView.swift
//  My News
//
//  Created by Israel Manzo on 9/5/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - Delegates functions extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive && searchController.searchBar.text != "" {
            return filterNews.count
        }
        return newsArticle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        
        // Sub.MARK: This block gives the degin to the table view cell
        cell.layer.cornerRadius = 9
        cell.layer.borderWidth = 3.5
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
        
        // Sub.MARK: Date formatting - String to Date block
        let publishDate = newsArticle[indexPath.row].publishedAt?.replacingOccurrences(of: "T", with: " ")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        
        //"2016-12-15T22:05:24Z"
        let date = dateFormatter.date(from: publishDate!)
        let date2 = Date()
        
        cell.setCell(title: articles.title!, description: articles.description!, time: date2.offset(from: date!) + " " + "ago.")
        
        let newPhoto = articles
        cell.updateImageCell(cellData: newPhoto)
        
        return cell
    }
}
