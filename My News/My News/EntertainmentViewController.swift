//
//  EntertainmentViewController.swift
//  My News
//
//  Created by Israel Manzo on 8/4/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import UIKit

class EntertainmentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var menu: UIBarButtonItem!
    
    var entertainmentArticles = [EntArticle]()
    
    var closure = EntertainnmentModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        closure.fetchData { (article) in
            self.entertainmentArticles = article!
            self.collectionView.reloadData()
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        navigationController?.navigationBar.barTintColor = .black
        menu.tintColor = .white
        
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Entertainment"
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name:"Marker Felt", size:20.0)!, NSForegroundColorAttributeName:UIColor.white
        ]
    }
    
    // MARK: - Delegate Functions
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entertainmentArticles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EntCollectionViewCell
        
        cell.layer.cornerRadius = 9
        
        cell.titleLbl.text = entertainmentArticles[indexPath.row].title
        
        cell.dateLbl.text = entertainmentArticles[indexPath.row].publishedAt
        
        // MARK: Date formatting - String to Date block
//        let publishDate = entertainmentArticles[indexPath.row].publishedAt?.replacingOccurrences(of: "T", with: " ")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        
        //"2016-12-15T22:05:24Z"
//        let date = dateFormatter.date(from: publishDate!)
//
//        let date2 = Date()
//        cell.dateLbl.text = date2.offset(from: date!) + " " + "ago."
        cell.dateLbl.text = "On Date"
        
        let photo = entertainmentArticles[indexPath.row]
        cell.updateImageCell(cellData: photo)
        
        return cell
    }
    
    // MARK: - PRepare for segue from collection view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "entWeb" {
            if let indexPath = self.collectionView.indexPath(for: sender as! UICollectionViewCell) {
                let detailVC = segue.destination as! WebEntViewController
                detailVC.webSite = self.entertainmentArticles[indexPath.row].url
            }
        }
    }
}


