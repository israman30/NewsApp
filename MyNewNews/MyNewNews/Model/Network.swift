//
//  Network.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/29/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

protocol NetworkProtocol {
    func fetchData(_ urlString: String, completion:@escaping(Result<[ModelArticles], APIError>)->())
}

enum APIError: Error {
    case responseProblem
    case decodingProblem(Error)
    case errorWithWrongURL(Error)
}

// MARK: =================== NETWORK CALL ===================
class Network: NetworkProtocol {
    
    private let api_key = API_KEY()
    
    static let shared = Network()
    
    func getData(completion: @escaping(Result<[ModelArticles], APIError>)->()) {
        let endpoint = "https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=\(api_key.BODY)"
        fetchData(endpoint, completion: completion)
    }
    
    func jsonObject(completion: @escaping(Result<[ModelArticles], APIError>)->()) {
       let endpoint = "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=\(api_key.HEADER)"
        fetchData(endpoint, completion: completion)
    }
    
    func fetchData(_ urlString: String, completion: @escaping(Result<[ModelArticles], APIError>)->()) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.errorWithWrongURL(error)))
                print("Error getting data", error.localizedDescription)
                return
            }
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode), let data = data else {
                completion(.failure(.responseProblem))
                return
            }

            do {
             let jsonData = try JSONDecoder().decode(Articles.self, from: data)

             DispatchQueue.main.async {
                 completion(.success(jsonData.articles))
             }

            } catch let error {
                completion(.failure(.decodingProblem(error)))
                print("Error parsing json")
            }
        }
        task.resume()

    }
    
    
}
