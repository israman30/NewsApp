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
        collectionDelegates()
        revealEntertainmentController()
        
        closure.fetchData { (article) in
            self.entertainmentArticles = article!
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        enternaimentNavBarSetUp()
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



