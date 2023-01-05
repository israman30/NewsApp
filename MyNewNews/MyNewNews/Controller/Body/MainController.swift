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
    
    let emptyListLabelMessage: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let network: Network = .shared
    
    var articlesList: ArticlesListViewModel!
    
    let detailView = DetailController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController()
        setCollectionView()
        renderBody()
        articlesList = ArticlesListViewModel()
        
        DispatchQueue.main.async {
            self.detailView.view.setNeedsLayout()
        }
    }
    
    fileprivate func renderBody() {
        network.jsonObject { [weak self] result in
            switch result {
            case .success(let articlesList):
                self?.articlesList.articles = articlesList.map { ArticlesViewModel(article: $0) }
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self?.emptyListLabelMessage.text = "Something went wrong..! CONNECTION NOT FOUND"
                }
            }
        }
    }
    
    deinit {
        articlesList = nil
    }
    
}



