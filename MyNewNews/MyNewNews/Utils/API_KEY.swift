//
//  API_KEY.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/30/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import Foundation

class NNAKEY {
    static var bodyKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "NNAKEY-Info", ofType: "plist") else {
                fatalError("Couldn't find file 'NNAKEY-Info.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "BODY_KEY") as? String else {
                fatalError("Couldn't find key 'BODY_KEY' in 'NNAKEY-Info.plist'.")
            }
            return value
        }
    }
    
    static var headerKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "NNAKEY-Info", ofType: "plist") else {
                fatalError("Couldn't find file 'NNAKEY-Info.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "HEADER_KEY") as? String else {
                fatalError("Couldn't find key 'BODY_KEY' in 'NNAKEY-Info.plist'.")
            }
            return value
        }
    }
}

class API_KEY {
    
    private var _BODY: String
    private var _HEADER: String
    
    init() {
        _BODY = NNAKEY.bodyKey
        _HEADER = NNAKEY.headerKey
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
