//
//  extensionEnt.swift
//  My News
//
//  Created by Israel Manzo on 3/24/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - Delegate Functions
extension EntertainmentViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entertainmentArticles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EntCollectionViewCell
        
        cell.layer.cornerRadius = 9
        let entTitle = entertainmentArticles[indexPath.row]
        let photo = entertainmentArticles[indexPath.row]
        
        // MARK: Date formatting - String to Date block
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        
        cell.setCell(title: entTitle.title!, time: "On Date")
        cell.updateImageCell(cellData: photo)
        
        return cell
    }
}
