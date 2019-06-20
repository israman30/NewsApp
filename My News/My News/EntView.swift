//
//  EntView.swift
//  My News
//
//  Created by Israel Manzo on 9/20/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension EntertainmentViewController {
    
    func collectionDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func revealEntertainmentController(){
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        navigationController?.navigationBar.barTintColor = .black
        menu.tintColor = .white
        
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
    }
    
    func enternaimentNavBarSetUp(){
        navigationItem.title = "Entertainment"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name:"Marker Felt", size:20.0)!, NSAttributedString.Key.foregroundColor:UIColor.white
        ]
        navigationController?.navigationBar.tintColor = .white
    }
    
}



