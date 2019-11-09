//
//  NewsModel.swift
//  My News
//
//  Created by Israel Manzo on 1/15/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation

class NewsModel {

    private func parseJson(with data: Data, completion: @escaping ([NewsArticle]?)-> ()){
        
        var newsArticles: [NewsArticle] = []
        
        if let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any] {
            let readArticles = jsonObject["articles"] as! [[String:Any]]
            
            readArticles.forEach { newArticles in
                let articles = NewsArticle(data: newArticles)
                newsArticles.append(articles)
            }
            DispatchQueue.main.async {
                completion(newsArticles)
            }
        }
    }
    
    private let api_key = API_KEY()
    
    func fetchData(with closure: @escaping ([NewsArticle]?)-> ()){
        
        let urlString = "https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=\(api_key.HOME)"
        guard let urlRequest = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: urlRequest) { rawData, response, error in
            
            if let error = error { fatalError("No data could be received: \(error)") }
            
            guard let data = rawData else {
                closure(nil)
                return
            }
            self.parseJson(with: data, completion: closure)
        }
        task.resume()
    }
}






