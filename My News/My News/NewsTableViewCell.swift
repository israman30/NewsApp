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
        guard let cell = cellData.imageURL else {return}
        let url = URL(string: cell)
        DispatchQueue.global().async {
            do {
                guard let url = url else {return}
                let urlData = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.newsImage.image = UIImage(data: urlData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func setCell(title: String, description: String, time: String){
        titleLabel.text = title
        descriptionLabel.text = description
        timeLabel.text = time
    }
}
