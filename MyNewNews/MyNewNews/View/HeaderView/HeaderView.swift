//
//  HeaderView.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/29/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

extension HeaderController {
    
    func setCollectionViewHeader() {
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: Cell.header.rawValue)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}
