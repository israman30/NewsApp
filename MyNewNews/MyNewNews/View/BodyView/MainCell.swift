//
//  MainCell.swift
//  MyNewNews
//
//  Created by Israel Manzo on 1/29/20.
//  Copyright © 2020 Israel Manzo. All rights reserved.
//

import UIKit

// MARK: - MAIN CELL - Display the list of articles from API call
class MainCell: UICollectionViewCell {
    
    func configure(vm: ArticlesViewModel) {
        titleLabel.text = vm.title
        descriptionLabel.text = vm.description
        mainPhotoImage.cacheUrlString(urlString: vm.urlToImage)
        timeLabel.text = vm.publishedAt
    }
    
    let cardContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let mainPhotoImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let containerLabel: UIView = {
        let view = UIView()
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.makeTextDynamic(textStyle: .headline)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.makeTextDynamic(textStyle: .caption1)
        label.numberOfLines = 3
        label.textColor = .black
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Monday, 23 June"
        label.textColor = .darkGray
        label.makeTextDynamic(textStyle: .caption1)
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .rgb(red: 245, green: 244, blue: 244)
        
        addSubview(cardContainer)
        cardContainer.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5))
        cardContainer.dropShadow()
        
        cardContainer.addSubview(mainPhotoImage)
        mainPhotoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainPhotoImage.leftAnchor.constraint(equalTo: cardContainer.leftAnchor),
            mainPhotoImage.topAnchor.constraint(equalTo: cardContainer.topAnchor),
            mainPhotoImage.rightAnchor.constraint(equalTo: cardContainer.rightAnchor),
            mainPhotoImage.heightAnchor.constraint(equalTo: cardContainer.heightAnchor, multiplier: 3/4)
        ])
        
        cardContainer.addSubview(containerLabel)
        containerLabel.backgroundColor = .white
        containerLabel.anchor(top: mainPhotoImage.bottomAnchor, left: cardContainer.leftAnchor, bottom: cardContainer.bottomAnchor, right: cardContainer.rightAnchor)

        let stackView = UIStackView(arrangedSubviews:
            [titleLabel, timeLabel]
        )
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = -5

        containerLabel.addSubview(stackView)
        stackView.anchor(top: containerLabel.topAnchor, left: containerLabel.leftAnchor, bottom: containerLabel.bottomAnchor, right: containerLabel.rightAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HostCollectionViewCell: UICollectionViewCell {
    
}

