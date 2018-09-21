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
   
    func setCell(title: String?, description: String?, time: String?){
        guard let title = title,
              let description = description,
              let time = time else { return }
        titleLabel.text = title
        descriptionLabel.text = description
        timeLabel.text = time
    }
}
