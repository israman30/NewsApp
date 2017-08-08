//
//  TechViewController.swift
//  My News
//
//  Created by Israel Manzo on 8/8/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class TechViewController: UIViewController {

    @IBOutlet weak var menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
    }

   
}
