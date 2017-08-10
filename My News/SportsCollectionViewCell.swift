//
//  SportsCollectionViewCell.swift
//  My News
//
//  Created by Israel Manzo on 8/10/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class SportsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    func updateImageCell(cellData: SportsArticle){
        let url = URL(string: cellData.imageURL!)
        
        DispatchQueue.global().async {
            do {
                let urlData = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.imagePhoto.image = UIImage(data: urlData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
}
