//
//  HeaderController.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/29/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - HEADER CONTROLLER INTERACTS WITH REUSABLE VIEW HEADER -
class HeaderController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .rgb(red: 245, green: 244, blue: 244)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    let headerClosure = Network()
    
    let titleHeader = UILabel()
    
//    var articles = [ModelArticles]()
    var articlesHeader = [ArticlesViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setCollectionViewHeader()
        renderHeader()
        
    }
    
    fileprivate func renderHeader() {
        headerClosure.jsonObject { (articles, error) in
            if let error = error {
                print("Error rendering header", error.localizedDescription)
                return
            }
            guard let articlesJson = articles else { return }
            
            self.articlesHeader = articlesJson.map { return ArticlesViewModel(articles: $0) }
//            self.articles = articlesJson
            self.collectionView.reloadData()
        }
    }
    
}


