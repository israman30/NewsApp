//
//  ViewController.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/28/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - MAIN CONTROLLER DISPLAY A LIST OF ARTICLES -

class MainController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .rgb(red: 245, green: 244, blue: 244)
        return cv
    }()
    
    let network: Network = .shared
    
    var articles = [ArticlesViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController()
        setCollectionView()

        renderBody()
    }
    
    fileprivate func renderBody() {
        network.jsonObject { result in
            switch result {
            case .success(let articlesList):
                self.articles = articlesList.map { return ArticlesViewModel(articles: $0) }
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}



