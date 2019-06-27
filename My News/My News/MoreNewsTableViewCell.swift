//
//  MoreNewsTableViewCell.swift
//  My News
//
//  Created by Israel Manzo on 8/8/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class MoreNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    var moreNews: MoreNewsArticles? {
        didSet {
            if let dateArticle = moreNews?.publishedAt {
                dateLbl.text = setDateFormat(dateString: dateArticle)
            }
            
            guard let titleNews = moreNews?.title else { return }
            titleLbl.text = titleNews
            
            if let articleImage = moreNews?.imageURL {
                imagePhoto.cacheUrlString(urlString: articleImage)
            }
        }
    }
    func setDateFormat(dateString: String)-> String {
        let format = DateFormatter()
        format.dateFormat = "MMM d, YYYY"
        if let date = format.date(from: dateString) {
            return format.string(from: date)
        }
        return "Uncertain date"
    }
    
}

