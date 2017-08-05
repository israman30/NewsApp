//
//  EntArticle.swift
//  My News
//
//  Created by Israel Manzo on 8/4/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation

class EntArticle {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var imageURL: String?
    var publishedAt: String?
    init(data: [String:Any]){
        author = data["author"] as?  String ?? "unknown"
        title = data["title"] as? String ?? "unknonw"
        description = data["description"] as?  String ?? "unknown"
        url = data["url"] as? String ?? "unknown"
        imageURL = data["urlToImage"] as? String ?? "unknown"
        print(imageURL ?? "")
        publishedAt = data["publishedAt"] as? String ?? "unknown"
    }

}
