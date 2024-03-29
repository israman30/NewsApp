//
//  ArticlesViewModel.swift
//  MyNewNews
//
//  Created by Israel Manzo on 2/12/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

class ArticlesListViewModel {
    
    var articles: [ArticlesViewModel]!
    
    init() {
        self.articles = [ArticlesViewModel]()
    }
    
    func articlesViewModel(at index: Int) -> ArticlesViewModel {
        return articles[index]
    }
    
    deinit {
        self.articles = nil
    }
}

struct ArticlesViewModel {
    
    let article: ModelArticles
    
    var title: String {
        return article.title ?? "NOT TITLE"
    }
    
    var description: String {
        return article.description ?? "NO DESCRIPTION"
    }
    
    var publishedAt: String {
        if let time = article.publishedAt {
            let newTime = time.replacingOccurrences(of: "T", with: " ")
            return TimeString.setDateString(date: newTime)
        } else {
            return "No time displayed"
        }
    }
    
    var url: String {
        return article.url ?? "404 NOT FOUND"
    }
    
    var urlToImage: String {
        article.urlToImage ?? "IMAGE IS NIL"
    }
}
