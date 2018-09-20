//
//  NextVC.swift
//  My News
//
//  Created by Israel Manzo on 7/30/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class NextVC: UIViewController {

    @IBOutlet weak var menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        menu.tintColor = UIColor.white
        
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
    }
}
