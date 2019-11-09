//
//  EntModel.swift
//  My News
//
//  Created by Israel Manzo on 8/4/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation

class EntertainnmentModel {

    func parseJSON(with data: Data, conpletion: @escaping ([EntArticle]?)->()){
        
        var entArticles: [EntArticle] = []
        
        if let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : Any] {
            let readArticles = jsonObject["articles"] as! [[String : Any]]
            
            readArticles.forEach { articlesNew in
                let articles = EntArticle(data: articlesNew)
                entArticles.append(articles)
            }
            DispatchQueue.main.async {
                conpletion(entArticles)
            }
        }
    }

    func fetchData(with closure: @escaping([EntArticle]?)->()){
        
        let url = "https://newsapi.org/v1/articles?source=entertainment-weekly&sortBy=top&apiKey=219d19ee586b4a049fafb28d3ecb7707"
        guard let request = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error { fatalError("No data could be received: \(error)") }
            
            guard let dataResponse = data else {
                closure(nil)
                return
            }
            self.parseJSON(with: dataResponse, conpletion: closure)
        }
        task.resume()
    }
}
