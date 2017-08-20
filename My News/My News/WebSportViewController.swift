//
//  WebSportViewController.swift
//  My News
//
//  Created by Israel Manzo on 8/9/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class WebSportViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var webSite: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let address = webSite {
            let url = URL(string: address)
            let request = URLRequest(url: url!)
            webView.loadRequest(request)
            
        }
    }
}
