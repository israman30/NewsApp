//
//  NextViewController.swift
//  My News
//
//  Created by Israel Manzo on 7/30/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.


import UIKit

class NextViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let cell = "cell"
    
    
    var icons = ["home.png", "contact.png", "web.png" ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cell) as! NextTableViewCell
        
//        cell?.textLabel?.text = titles[indexPath.row]
//        cell?.textLabel?.textColor = UIColor.white
        let menuTitle = icons[indexPath.row]
        
        cell.photoImage.image = UIImage(named:menuTitle)
        
        return cell
    }

}
