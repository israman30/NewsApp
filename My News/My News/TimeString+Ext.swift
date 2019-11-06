//
//  TimeString+Ext.swift
//  My News
//
//  Created by Israel Manzo on 11/5/19.
//  Copyright © 2019 Israel Manzo. All rights reserved.
//

import Foundation

class TimeString {
    static func setDateString(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        let date = dateFormatter.date(from: date)
        let date2 = Date()
        return date2.offset(from: date!) + " " + "ago."
    }
}
