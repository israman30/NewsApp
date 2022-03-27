//
//  Body+Delegates+DataSource.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/29/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - DEATA SOURCE & DELEGATES -
extension MainController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: ============================ BODY ===============================
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articlesList.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.body.rawValue, for: indexPath) as! MainCell
        let vm = articlesList.articlesViewModel(at: indexPath.item)
        cell.configure(vm: vm)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailController()
        detailViewController.articlePage = articlesList.articles[indexPath.item].url
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 280)
    }
    
    // MARK: ============================ HEADER ===============================
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Cell.header.rawValue, for: indexPath)
        return header
    }
}

extension UICollectionView {

    // MARK: - TABLE VIEW EMPTY MESSAGE DISPLAY FUNCTION
    func setEmptyTableMessage(_ message: String) {
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 35)
        messageLabel.sizeToFit()

        backgroundView = messageLabel
    }

    // MARK: - RESTORE/RELOAD TABLE VIEW FOR ROW ADDED
    func reloadTable() {
        self.backgroundView = nil
    }
}
class ErrorNetwork: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let label = UILabel()
        label.text = "404"
        label.font = .boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.font = UIFont(name: "Chalkduster", size: 40)
        
        addSubview(label)
        label.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
