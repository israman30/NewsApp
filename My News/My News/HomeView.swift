//
//  HomeView.swift
//  My News
//
//  Created by Israel Manzo on 9/20/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension HomeController {
    
    func setMainView(){
        view.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func slideMenu(){
        // MARK: - Slide Menu block
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        menu.tintColor = .white
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
    }
    
    func setNavController(){
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name:"Marker Felt", size:20.0)!, NSAttributedString.Key.foregroundColor:UIColor.white
        ]
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .white
    }
}
