//
//  EntCollectionViewCell.swift
//  My News
//
//  Created by Israel Manzo on 8/5/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class EntCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func updateImageCell(cellData: EntArticle){
        let url = URL(string: cellData.imageURL!)
        
        DispatchQueue.global().async {
            do {
                let urlData = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.photoImage.image = UIImage(data: urlData)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
