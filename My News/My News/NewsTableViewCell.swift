//
//  NewsTableViewCell.swift
//  My News
//
//  Created by Israel Manzo on 1/15/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
   
    func setCell(title: String?, description: String?, time: String?){
        guard let title = title,
              let description = description,
              let time = time else { return }
        titleLabel.text = title
        descriptionLabel.text = description
        timeLabel.text = time
    }
    
}
/*
 // Sub.MARK: Date formatting - String to Date block
 let publishDate = newsArticle[indexPath.row].publishedAt?.replacingOccurrences(of: "T", with: " ")
 let dateFormatter = DateFormatter()
 dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
 
 //"2016-12-15T22:05:24Z"
 let date = dateFormatter.date(from: publishDate!)
 let date2 = Date()
 
 cell.setCell(title: articles.title!, description: articles.description!, time: date2.offset(from: date!) + " " + "ago.")
 */
