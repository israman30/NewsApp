//
//  Network.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/29/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

typealias Handler = (Result<[ModelArticles], APIError>) -> Void

protocol NetworkProtocol {
    func fetchData(_ urlString: String, completion: @escaping Handler)
}

enum APIError: Error {
    case responseProblem
    case decodingProblem(Error)
    case errorWithWrongURL(Error)
    case invalidData
}

// MARK: =================== NETWORK CALL ===================
final class Network: NetworkProtocol {
    
    private let api_key = API_KEY()
    
    static let shared = Network()
    
    private init() {}
    
    func getData(completion: @escaping Handler) {
        let endpoint = Constants.headingEndpoint + api_key.BODY
        fetchData(endpoint, completion: completion)
    }
    
    func jsonObject(completion: @escaping Handler) {
        let endpoint = Constants.bodyEndpoint + api_key.HEADER
        fetchData(endpoint, completion: completion)
    }
    
    func fetchData(_ urlString: String, completion: @escaping Handler) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
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
                print("Error parsing json: \(error.localizedDescription)")
            }
        }
        task.resume()
        
    }
    
}
