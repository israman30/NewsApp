//
//  WebViewViewController.swift
//  My News
//
//  Created by Israel Manzo on 1/16/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController {

    var webSite: String?
  
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let address = webSite {
            guard let webURL = URL(string: address) else {return}
            let urlRequest = URLRequest(url: webURL)
            webView.loadRequest(urlRequest)
        }
    }
}
