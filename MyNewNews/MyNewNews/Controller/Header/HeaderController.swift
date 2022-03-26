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
    
    let headerNetwork: Network = .shared
    
    let titleHeader = UILabel()
    
    var articlesList = ArticlesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setCollectionViewHeader()
        renderHeader()
        
    }
    
    fileprivate func renderHeader() {
        headerNetwork.getData { result in
            switch result {
            case .success(let articlesList):
                self.articlesList.articles = articlesList.map { ArticlesViewModel(article: $0) }
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}


