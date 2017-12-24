//
//  SecondViewController.swift
//  My News
//
//  Created by Israel Manzo on 7/30/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var menu: UIBarButtonItem!
    
    var sportArticles = [SportsArticle]()
    
    var closure = SportModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        closure.fetData { (articles) in
            self.sportArticles = articles!
            self.collectionView.reloadData()
        }
        
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        menu.tintColor = UIColor.white
        
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
    }
    
    // MARK: - Navigations controller setup
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Sports"
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name:"Marker Felt", size:20.0)!, NSForegroundColorAttributeName:UIColor.white]
    }
    
    // MARK: - Delegate Functions
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportArticles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SportsCollectionViewCell
        
        cell.layer.cornerRadius = 9
        
        
        cell.titleLbl.text = sportArticles[indexPath.row].title

//        let publishDate = sportArticles[indexPath.row].publishedAt?.replacingOccurrences(of: "T", with: " ")
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
//        
//        //"2016-12-15T22:05:24Z"
//        let date = dateFormatter.date(from: publishDate!)
//        
//        let date2 = Date()
////        cell.dateLbl.text = date2.offset(from: date!) + " " + "ago."
        
        let imageSport = sportArticles[indexPath.row]
        cell.updateImageCell(cellData: imageSport)
        
        return cell
    }
    
    // MARK: - Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSport" {
            if let indexPath = self.collectionView.indexPath(for: sender as! UICollectionViewCell){
                let detailSports = segue.destination as! WebSportViewController
                detailSports.webSite = self.sportArticles[indexPath.row].url
            }
        }
    }
}
