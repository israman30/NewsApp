//
//  MoreNewsTableViewCell.swift
//  My News
//
//  Created by Israel Manzo on 8/8/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class MoreNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePhoto: UIImageView!

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    func imageUpdateCell(cellData: MoreNewsArticles){
        guard let cell = cellData.imageURL else {return}
        let url = URL(string: cell)
        DispatchQueue.global().async {
            do {
                guard let url = url else {return}
                let urlData = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.imagePhoto.image = UIImage(data: urlData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func setCell(title: String, time: String){
        titleLbl.text = title
        dateLbl.text = time
    }
}
