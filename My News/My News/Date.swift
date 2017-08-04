//  Date.swift
//  My News
//
//  Created by Israel Manzo on 3/26/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation

extension Date {
    
    var prettyLocaleFormatted : String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .none)
    }
    
    var prettyLocaleFormattedWithTime : String {
        return DateFormatter.localizedString(from: self, dateStyle: .long, timeStyle: .short)
    }
    
    var prettyLocaleFormattedShortWithTime : String {
        return DateFormatter.localizedString(from: self, dateStyle: .short, timeStyle: .short)
    }
}
