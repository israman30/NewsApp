//
//  View+Helpers.swift
//  My News
//
//  Created by Israel Manzo on 6/25/19.
//  Copyright © 2019 Israel Manzo. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(){
        layer.cornerRadius = 9
        layer.borderWidth = 3.5
        layer.borderColor = UIColor.black.cgColor
        clipsToBounds = true
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
    }
}
