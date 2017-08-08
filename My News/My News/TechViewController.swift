//
//  TechViewController.swift
//  My News
//
//  Created by Israel Manzo on 8/8/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class TechViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var menu: UIBarButtonItem!
    
    var technologyArticles = [TechArticle]()
    
    var closure = TechModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        closure.fetchData { (article) in
            self.technologyArticles = article!
            self.tableView.reloadData()
        }

        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        menu.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return technologyArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell") as! TechTableViewCell
        
        cell.dateLbl.text = technologyArticles[indexPath.row].title
        cell.titleLbl.text = technologyArticles[indexPath.row].title
        
        let photo = technologyArticles[indexPath.row]
        cell.updateImageCell(cellData: photo)
        
        return cell
    }

   
}
