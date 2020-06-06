//
//  Network.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/29/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: =================== NETWORK CALL ===================
class Network {
    
    private let api_key = API_KEY()
    
    func getData(completion: @escaping([ModelArticles]?, Error?)->()) {
        let endpoint = "https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=\(api_key.BODY)"
        fetchData(endpoint, completion: completion)
    }
    
    func jsonObject(completion: @escaping([ModelArticles]?, Error?)->()) {
       let endpoint = "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=\(api_key.HEADER)"
        fetchData(endpoint, completion: completion)
    }
    
    private func fetchData(_ urlString: String, completion:@escaping([ModelArticles]?, Error?)->()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if let error = error {
             completion(nil, error)
                print("Error getting data", error.localizedDescription)
                return
            }

            do {
             guard let data = data else { return }
             let jsonData = try JSONDecoder().decode(Articles.self, from: data)

             DispatchQueue.main.async {
                 completion(jsonData.articles, nil)
             }

            } catch {
                print("Error parsing json")
            }
        }.resume()

    }
    
    
}
