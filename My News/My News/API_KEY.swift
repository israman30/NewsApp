//
//  API_KEY.swift
//  My News
//
//  Created by Israel Manzo on 11/9/19.
//  Copyright © 2019 Israel Manzo. All rights reserved.
//

import Foundation

class API_KEY {
    
    private var _HOME: String
    private var _ENTERTAINMENT: String
    private var _MORE_NEWS: String
    
    init(){
        _HOME = "066d82458ed84eeeac28a86095ec88b9"
        _ENTERTAINMENT = "219d19ee586b4a049fafb28d3ecb7707"
        _MORE_NEWS = "219d19ee586b4a049fafb28d3ecb7707"
    }
    
    var HOME: String {
        get {
            return _HOME
        }
    }
    var ENTERTAINMENT: String {
        get {
            return _ENTERTAINMENT
        }
    }
    var MORE_NEWS: String {
        get {
            return _MORE_NEWS
        }
    }
}
