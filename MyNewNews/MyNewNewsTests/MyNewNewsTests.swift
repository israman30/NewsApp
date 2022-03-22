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
    
    var articlesTest: ModelArticles!
    func testCourses() {
        let network: Network = .shared
        network.getData { result in
            switch result {
            case .success(let _):
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        guard let articles = articlesTest else { return }
        let articlesViewModel = ArticlesViewModel(articles: articles)
        XCTAssertEqual(articles.title, articlesViewModel.title)
        XCTAssertEqual(articles.description, articlesViewModel.description)
        XCTAssertEqual(articles.url, articlesViewModel.url)
        XCTAssertEqual(articles.publishedAt, articlesViewModel.publishedAt)
        XCTAssertEqual(articles.urlToImage, articlesViewModel.urlToImage)
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
