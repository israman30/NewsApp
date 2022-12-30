//
//  HeaderCell.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/29/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    var headerViewModel: ArticlesViewModel? {
        didSet {
            guard let titleHeader = headerViewModel?.title else { return }
            titleLabel.text = titleHeader
            if let headerPhoto = headerViewModel?.urlToImage {
                photoImageHeader.cacheUrlString(urlString: headerPhoto)
            } else {
                photoImageHeader.image = #imageLiteral(resourceName: "placeholder")
            }
        }
    }
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let photoImageHeader: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        iv.layer.borderColor = UIColor.black.cgColor
        iv.layer.borderWidth = 5
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.makeTextDynamic(textStyle: .subheadline)
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
        containerView.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            padding: .init(top: 5, left: 5, bottom: 5, right: 5),
            size: .zero
        )
        
        containerView.addSubViews(photoImageHeader, titleLabel)
        
        photoImageHeader.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom:containerView.bottomAnchor, right: containerView.rightAnchor)
        
        titleLabel.anchor(top: nil, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, padding: .init(top: 0, left: 5, bottom: 5, right: 5), size: .init(width: 0, height: 20))
    }
    
    func configure(vm: ArticlesViewModel) {
        titleLabel.text = vm.title
        photoImageHeader.cacheUrlString(urlString: vm.urlToImage)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageHeader.image = nil
        titleLabel.text = ""
    }
    
    deinit {
        photoImageHeader.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
