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
    
    func setCell(title: String?, time: String?){
        guard let title = title, let time = time else { return }
        titleLbl.text = title
        dateLbl.text = time
    }
}
