//
//  MoreNewsModel.swift
//  My News
//
//  Created by Israel Manzo on 8/8/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation

class MoreNewsModel {

    func parseJson(data: Data, completion: @escaping([MoreNewsArticles]?)->()){
        
        var newsArticle:[MoreNewsArticles] = []
        
        if let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any]{
            
            let readArticle = jsonObject["articles"] as! [[String:Any]]
            
            for newArticle in readArticle {
                let articles = MoreNewsArticles(data: newArticle)
                newsArticle.append(articles)
            }
            DispatchQueue.main.async {
                completion(newsArticle)
            }
        }
    }
    
    func fetchData(with closure: @escaping([MoreNewsArticles]?)->()){
    
        let url = "https://newsapi.org/v1/articles?source=reuters&sortBy=top&apiKey=219d19ee586b4a049fafb28d3ecb7707"
        let request = URL(string: url)!
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let dataResponse = data else {
                closure(nil)
                return
            }
            self.parseJson(data: dataResponse, completion: closure)
        }
        task.resume()
    }
    
}
