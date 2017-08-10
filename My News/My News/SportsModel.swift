//
//  SportsModel.swift
//  My News
//
//  Created by Israel Manzo on 8/9/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation

class SportModel {
    
    func parseJson(data: Data, comletionHandler: @escaping([SportsArticle]?)->()){
        
        var sportArticles: [SportsArticle] = []
        
        if let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any] {
            
            let readArticles = jsonObject["articles"] as! [[String:Any]]
            
            for newArticles in readArticles {
                let articles = SportsArticle(data: newArticles)
                sportArticles.append(articles)
            }
            
            DispatchQueue.main.async {
                comletionHandler(sportArticles)
            }
        }
    }
    
    func fetData(with closure: @escaping([SportsArticle]?)->()){
        
        let url = "https://newsapi.org/v1/articles?source=fox-sports&sortBy=top&apiKey=219d19ee586b4a049fafb28d3ecb7707"
        let request = URL(string: url)!
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let dataResponse = data else {
                closure(nil)
                return
            }
            self.parseJson(data: dataResponse, comletionHandler: closure)
        }
        task.resume()
    }

}
