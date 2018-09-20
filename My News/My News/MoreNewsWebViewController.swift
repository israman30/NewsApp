//
//  MoreNewsWebViewController.swift
//  My News
//
//  Created by Israel Manzo on 8/8/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class MoreNewsWebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var webSite: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let address = webSite {
            guard let url = URL(string: address) else {return}
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
}
