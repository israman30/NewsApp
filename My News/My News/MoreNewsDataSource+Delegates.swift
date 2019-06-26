//
//  extensionMoreNews.swift
//  My News
//
//  Created by Israel Manzo on 3/24/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - Delegate Functions
extension MoreNewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moreNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.moreNews.rawValue) as! MoreNewsTableViewCell
        cell.roundCorners()
        cell.moreNews = moreNews[indexPath.row]
        return cell
    }
}
