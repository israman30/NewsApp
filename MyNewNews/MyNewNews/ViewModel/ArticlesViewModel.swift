//
//  ArticlesViewModel.swift
//  MyNewNews
//
//  Created by Israel Manzo on 2/12/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit
import WebKit

class ArticlesViewModel {
    let title: String?
    let description: String?
    let url: String?
    var urlToImage: String?
    let publishedAt: String?
    
    init(articles: ModelArticles) {
        self.title = articles.title
        self.description = articles.description
        self.url = articles.url
        self.urlToImage = articles.urlToImage
        
        // MARK: - Time display with Date Formatter
        if let time = articles.publishedAt {
            let newTime = time.replacingOccurrences(of: "T", with: " ")
            publishedAt = TimeString.setDateString(date: newTime)
        } else {
            publishedAt = "No time displayed"
        }
    }    
    
}

