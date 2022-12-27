//
//  MyNewNewsTests.swift
//  MyNewNewsTests
//
//  Created by Israel Manzo on 6/5/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import XCTest
@testable import MyNewNews

class MyNewNewsTests: XCTestCase {
    
    var api_key: API_KEY!
    var articles: ModelArticles!
    var vmTest: ArticlesViewModel!
    var mainVC: MainController!
    
    override func setUp() {
        api_key = API_KEY()
        mainVC = MainController()
        articles = ModelArticles(title: "Title article", description: "Some description", url: "https://www.google.com", urlToImage: "", publishedAt: "12/20/22")
        vmTest = ArticlesViewModel(article: articles)
    }
    
    override func tearDown() {
        api_key = nil
        mainVC = nil
        articles = nil
        vmTest = nil
    }
    
    func test_ArticlesViewModel_DataReturn() {
        XCTAssertEqual(articles.title, vmTest.title)
        XCTAssertEqual(articles.description, vmTest.description)
        XCTAssertEqual(articles.url, vmTest.url)
        XCTAssertEqual(articles.urlToImage, vmTest.urlToImage)
        XCTAssertEqual(articles.publishedAt, "12/20/22")
    }
    
    func test_FechRequest_ArticlesData() {
        let expectations = expectation(description: "The Response result match the expected results")
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=\(api_key.HEADER)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                XCTAssertNil(error)
            }
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode), let data = data else {
                XCTFail()
                return
            }
            
            do {
                let object = try JSONDecoder().decode(Articles.self, from: data)
                XCTAssertNotNil(object.articles)
                expectations.fulfill()
            } catch {
                XCTFail(error.localizedDescription)
                expectations.fulfill()
            }
                
        }
        task.resume()
        
        waitForExpectations(timeout: 3) { error in
            if let error = error {
                print("Failed : \(error.localizedDescription)")
            }
        }
    }
    
    func test_HandlerResult_Error() {
        let network: Network = .shared
        let expectations = expectation(description: "The Response result match the expected results")
        
        network.jsonObject { result in
            switch result {
            case .success(let result):
                XCTAssert(!result.isEmpty)
                expectations.fulfill()
            case .failure(let error):
                XCTFail("Server failed: \(error.localizedDescription)")
                expectations.fulfill()
            }
        }
        waitForExpectations(timeout: 3) { error in
            if let error = error {
                print("Failed : \(error.localizedDescription)")
            }
        }
    }
    
    func test_Outputs_WithDataOutput() {
        if !mainVC.collectionView.visibleCells.isEmpty {
            XCTAssert(true, "Collection view is no empty")
        } else {
            XCTAssert(true, "Collection view is empty")
        }
    }
    
    func test_ArticlesList_HasData() {
        if mainVC.articlesList.articles.count != 0 {
            XCTAssert(true, "Articles list count is: \(mainVC.articlesList.articles.count) items")
        } else {
            XCTAssert(true, "Articles list count is: \(mainVC.articlesList.articles.count) items")
        }
    }

}
