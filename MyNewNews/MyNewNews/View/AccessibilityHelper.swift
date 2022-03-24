//
//  AccessibilityHelper.swift
//  MyNewNews
//
//  Created by Israel Manzo on 3/23/22.
//  Copyright © 2022 Israel Manzo. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func makeTextDynamic(textStyle: UIFont.TextStyle) {
        font = .preferredFont(forTextStyle: textStyle)
        adjustsFontForContentSizeCategory = true
    }
}
