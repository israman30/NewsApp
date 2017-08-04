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
    
    var titleNames = ["Home", "Contact", "Website"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isScrollEnabled = false
    }
    
    // MARK: - Delegates functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cell) as! NextTableViewCell
        
        let menuTitle = icons[indexPath.row]
        
        cell.title1Lbl.text = titleNames[indexPath.row]
        cell.photoImage.image = UIImage(named:menuTitle)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealVC:SWRevealViewController = revealViewController()
        
        let cell:NextTableViewCell = tableView.cellForRow(at: indexPath) as! NextTableViewCell
        
        if cell.title1Lbl.text! == "Home" {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "Home") as! ViewController
            let frontController = UINavigationController.init(rootViewController: viewController)
            revealVC.pushFrontViewController(frontController, animated: true)
            
        }
        
        if cell.title1Lbl.text! == "Contact" {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "NextVC") as! NextVC
            let frontController = UINavigationController.init(rootViewController: viewController)
            revealVC.pushFrontViewController(frontController, animated: true)
            
        }
        
        if cell.title1Lbl.text! == "Website" {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
            let frontController = UINavigationController.init(rootViewController: viewController)
            revealVC.pushFrontViewController(frontController, animated: true)
            
        }
    }
}







