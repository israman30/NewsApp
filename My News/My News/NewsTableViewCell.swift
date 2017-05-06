//
//  NewsTableViewCell.swift
//  My News
//
//  Created by Israel Manzo on 1/15/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
   
    // MARK: Converting data to image
    func updateImageCell(cellData: NewsArticle){
        let url = URL(string: cellData.imageURL!)
        
        DispatchQueue.global().async {
            do {
                let urlData = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.newsImage.image = UIImage(data: urlData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
