//
//  CollectionView.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/28/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

extension MainController {
    
    func setNavigationController() {
        navigationItem.title = NSLocalizedString("My New News", comment: "Title header for application") 
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
        registerCollectionViewCellWithDelegatesDataSource()
        setEmptyListLabel()
    }
    
    func setEmptyListLabel() {
        emptyListLabelMessage.translatesAutoresizingMaskIntoConstraints = false
        collectionView.addSubview(emptyListLabelMessage)
        emptyListLabelMessage.centerInSuperview(size: .init(width: 300, height: 50))
    }
    
    func registerCollectionViewCellWithDelegatesDataSource() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Cell.header.rawValue)
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: Cell.body.rawValue)
    }
}


