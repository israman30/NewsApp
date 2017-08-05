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
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        menu.tintColor = UIColor.white
        
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entertainmentArticles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EntCollectionViewCell
        cell.titleLbl.text = entertainmentArticles[indexPath.row].title
        cell.descriptionLbl.text = entertainmentArticles[indexPath.row].description
        
        let photo = entertainmentArticles[indexPath.row]
        cell.updateImageCell(cellData: photo)
        
        
        return cell
    }

}
