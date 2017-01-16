//
//  NewsModel.swift
//  My News
//
//  Created by Israel Manzo on 1/15/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation

class NewsModel {

    func parseJson(data: Data, completionHandler: @escaping ([NewsArticle]?)-> ()){
        
        var newsArticles: [NewsArticle] = []
        
        if let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any] {
            let readArticles = jsonObject["articles"] as![[String:Any]]
            
            for newArticle in readArticles {
                let articles = NewsArticle(data: newArticle)
                newsArticles.append(articles)
            }
            DispatchQueue.main.async {
                completionHandler(newsArticles)
            }
        }
    }
    
    func fetchData(with closure: @escaping ([NewsArticle]?)-> ()){
        
        let urlString = "https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=066d82458ed84eeeac28a86095ec88b9"
        let urlRequest = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: urlRequest) { rawData, response, error in
            
            guard let responseData = rawData else {
                closure(nil)
                return
            }
            
            self.parseJson(data: responseData, completionHandler: closure)
        }
        task.resume()
    }
}








