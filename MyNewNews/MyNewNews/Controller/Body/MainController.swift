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
    
    let bodyClosure = Network()
    
    var articles = [ArticlesViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController()
        setCollectionView()

        renderBody()
        
    }
    
    fileprivate func renderBody() {
        bodyClosure.getData { (articles, error) in
            if let error = error {
                print("Error rendering header", error.localizedDescription)
                return
            }
            guard let jsonObject = articles else { return }
            self.articles = jsonObject.map { return ArticlesViewModel(articles: $0) }
            self.collectionView.reloadData()
        }
    }
    
}



