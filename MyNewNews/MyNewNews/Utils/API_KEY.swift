//
//  API_KEY.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/30/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import Foundation

class API_KEY {
    
    private var _BODY: String
    private var _HEADER: String
    
    static var shared = API_KEY()
    
    init() {
        _BODY = "066d82458ed84eeeac28a86095ec88b9"
        _HEADER = "219d19ee586b4a049fafb28d3ecb7707"
    }
    
    var NONE: String {
        get {
            return ""
        }
    }
    
    var BODY: String {
        get {
            return _BODY
        }
    }
    var HEADER: String {
        get {
            return _HEADER
        }
    }
}
