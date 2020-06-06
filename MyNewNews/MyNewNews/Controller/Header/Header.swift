//
//  Header.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/28/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - HEADER REUSABLE VIEW CLASS -
class Header: UICollectionReusableView {
    
    let headerView = HeaderController()
    
    let headerLineView = UIView()
    
    let headerTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubViews(headerLineView, headerTitle, headerView.view)
        
        headerTitle.text = "NEWS AND MORE"
        headerTitle.textColor = .gray
        headerTitle.font = .boldSystemFont(ofSize: 15)
        headerLineView.backgroundColor = .rgb(red: 245, green: 244, blue: 244)
        
        headerLineView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, padding: .zero, size: .init(width: 0, height: 0.4))
        
        headerTitle.anchor(top: headerLineView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, padding: .init(top: 5, left: 5, bottom: 0, right: 5), size: .init(width: 0, height: 20))
        
        headerView.view.anchor(top: headerTitle.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
