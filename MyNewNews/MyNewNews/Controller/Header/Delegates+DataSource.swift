//
//  Delegates+DataSource.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/29/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit
import SafariServices

// MARK: - DATA SOURCE & DELEGATES HEADER -
extension HeaderController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articlesList.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.header.rawValue, for: indexPath) as! HeaderCell
        let vm = articlesList.articlesViewModel(at: indexPath.item)
        cell.configure(vm: vm)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 220, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let headerDetail = HeaderDetail()
//        headerDetail.articlePage = articlesList.articles[indexPath.item].url
//        present(headerDetail, animated: true, completion: nil)
        guard let url = URL(string: articlesList.articles[indexPath.item].url) else { return }
        let safari = SFSafariViewController(url: url)
        present(safari, animated: true)
    }
}
