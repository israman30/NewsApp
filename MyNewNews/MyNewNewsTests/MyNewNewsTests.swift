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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ArticlesViewModel_DataReturn() {
        let articles = ModelArticles(title: "Title article", description: "Some description", url: "https://www.google.com", urlToImage: "", publishedAt: "12/20/22")
        let vmTest = ArticlesViewModel(article: articles)
        XCTAssertEqual(articles.title, vmTest.title)
        XCTAssertEqual(articles.description, vmTest.description)
        XCTAssertEqual(articles.url, vmTest.url)
        XCTAssertEqual(articles.urlToImage, vmTest.urlToImage)
        XCTAssertEqual(articles.publishedAt, "12/20/22")
    }
    
    func test_FechRequest_ArticlesData() {
        let api_key = API_KEY()
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

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
