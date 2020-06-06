//
//  ModelArticles.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/29/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: =================== MODEL ARTICLES ==================

struct Articles: Codable {
    let articles: [ModelArticles]
}

struct ModelArticles: Codable {
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}

