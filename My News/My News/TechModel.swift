//
//  TechModel.swift
//  My News
//
//  Created by Israel Manzo on 8/8/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation


class TechModel {

    func parseJson(data: Data, completion: @escaping([TechArticle]?)->()){
    
        var techArticles:[TechArticle] = []
        
        if let jasonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any]{
            
            let readArticles = jasonObject["articles"] as! [[String:Any]]
            
            for newAtricles in readArticles {
                let articles = TechArticle(data: newAtricles)
                techArticles.append(articles)
            }
            
            DispatchQueue.main.async {
                completion(techArticles)
            }
        }
    }
    
    func fetchData(with closure: @escaping([TechArticle]?)->()){
        
        let url = ""
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
