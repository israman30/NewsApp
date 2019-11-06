//
//  SetMainView.swift
//  My News
//
//  Created by Israel Manzo on 9/5/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - Delegates functions extension
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.homeCellId.rawValue, for: indexPath) as! NewsTableViewCell
        let articles: NewsArticle = newsArticle[indexPath.row]
        cell.roundCorners()
        let publishDate = newsArticle[indexPath.row].publishedAt?.replacingOccurrences(of: "T", with: " ")
        
        cell.setCell(title: articles.title!, description: articles.description!, time: TimeString.setDateString(date: publishDate!))
        
        if let profileImageUrl = articles.imageURL {
            cell.newsImage.cacheUrlString(urlString: profileImageUrl)
        }
        
        return cell
    }
    
}

