//
//  HeaderDetail.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/29/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit
import WebKit

// MARK: - HEADER DETAIL PRESENTS A VIEW WITH AN ARTICLE DETAIL

class HeaderDetail: UIViewController {
    
    var articlePage: String?
    
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(webView)
        webView.fillSuperview()
        loadWebView(articlePage)
    }
    
    func loadWebView(_ urlString: String? = nil) {
        if let urlString = urlString {
            guard let url = URL(string: urlString) else { return }
            let request = URLRequest(url: url)
            DispatchQueue.main.async {
                self.webView.load(request)
            }
        }
    }
}
