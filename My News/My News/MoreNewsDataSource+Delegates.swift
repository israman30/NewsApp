//
//  extensionMoreNews.swift
//  My News
//
//  Created by Israel Manzo on 3/24/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - Delegate Functions
extension MoreNewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.moreNews.rawValue) as! MoreNewsTableViewCell
        
        cell.layer.cornerRadius = 9
        cell.layer.borderWidth = 3.5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.clipsToBounds = true
        cell.layer.shadowOpacity = 0.23
        cell.layer.shadowRadius = 4
        
        let moreNewsTitle = moreNews[indexPath.row]
        let imageNews = moreNews[indexPath.row]
        
        // MARK: Date formatting - String to Date block
        let publishDate = moreNews[indexPath.row].publishedAt?.replacingOccurrences(of: "T", with: " ")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        
        //"2016-12-15T22:05:24Z"
        let date = dateFormatter.date(from: publishDate!)
        let date2 = Date()
        
        cell.setCell(title: moreNewsTitle.title!, time: date2.offset(from: date!) + " " + "ago.")
        
        if let imagePhotoUrl = imageNews.imageURL {
            cell.imagePhoto.cacheUrlString(urlString: imagePhotoUrl)
        }
        
        return cell
    }
}
