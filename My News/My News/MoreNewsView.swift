//
//  MoreNewsView.swift
//  My News
//
//  Created by Israel Manzo on 9/20/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension MoreNewsViewController {
    
    func revealController(){
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        menu.tintColor = .white
        navigationController?.navigationBar.barTintColor = .black
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
    }
    
    func setUpMoreNewsNavBar(){
        navigationItem.title = "More News"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name:"Marker Felt", size:20.0)!, NSAttributedString.Key.foregroundColor:UIColor.white
        ]
        navigationController?.navigationBar.tintColor = .white
    }
    
}
