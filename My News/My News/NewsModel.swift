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


class API_KEY {
    
    private var _HOME: String
    private var _ENTERTAINMENT: String
    private var _MORE_NEWS: String
    
    init(){
        _HOME = "066d82458ed84eeeac28a86095ec88b9"
        _ENTERTAINMENT = "219d19ee586b4a049fafb28d3ecb7707"
        _MORE_NEWS = "219d19ee586b4a049fafb28d3ecb7707"
    }
    
    var HOME: String {
        get {
            return _HOME
        }
    }
    var ENTERTAINMENT: String {
        get {
            return _ENTERTAINMENT
        }
    }
    var MORE_NEWS: String {
        get {
            return _MORE_NEWS
        }
    }
}





