//
//  EntModel.swift
//  My News
//
//  Created by Israel Manzo on 8/4/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation

class EntertainnmentModel {

    func parseJSON(data: Data, conpletionHandler:@escaping ([EntArticle]?)->()){
        
        var entArticles: [EntArticle] = []
        
        if let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any] {
            let readArticles = jsonObject["articles"] as! [[String:Any]]
            
            for articleNew in readArticles {
                let articles = EntArticle(data: articleNew)
                entArticles.append(articles)
            }
            DispatchQueue.main.async {
                conpletionHandler(entArticles)
            }
        }
    }

    func fetchData(with closure: @escaping([EntArticle]?)->()){
        
        let url = "https://newsapi.org/v1/articles?source=entertainment-weekly&sortBy=top&apiKey=219d19ee586b4a049fafb28d3ecb7707"
        let request = URL(string: url)!
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            guard let dataResponse = data else {
                closure(nil)
                return
            }
            self.parseJSON(data: dataResponse, conpletionHandler: closure)
        }
        task.resume()
    }
}
