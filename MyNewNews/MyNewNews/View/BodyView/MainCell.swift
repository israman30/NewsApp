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
    
    var articlesViewModel: ArticlesViewModel? {
        didSet {
            guard let titleBody = articlesViewModel?.title,
                  let descriptionBody = articlesViewModel?.description else { return }
            titleLabel.text = titleBody
            descriptionLabel.text = descriptionBody
            if let bodyThumbnail = articlesViewModel?.urlToImage {
                mainPhotoImage.cacheUrlString(urlString: bodyThumbnail)
            }
            guard let time = articlesViewModel?.publishedAt else { return }
            timeLabel.text = time
        }
    }
    
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
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.layer.masksToBounds = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 3
        label.textColor = .white
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Monday, 23 June"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .rgb(red: 245, green: 244, blue: 244)
        
        addSubview(mainPhotoImage)
        mainPhotoImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        mainPhotoImage.addSubview(containerLabel)
        containerLabel.anchor(top: nil, left: mainPhotoImage.leftAnchor, bottom: mainPhotoImage.bottomAnchor, right: mainPhotoImage.rightAnchor, padding: .zero, size: .init(width: 0, height: 60))
        
        let stackView = UIStackView(arrangedSubviews:
            [titleLabel, descriptionLabel, timeLabel]
        )
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        containerLabel.addSubview(stackView)
        stackView.anchor(top: nil, left: containerLabel.leftAnchor, bottom: containerLabel.bottomAnchor, right: containerLabel.rightAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5), size: .init(width: 0, height: 70))
        
    }
    // MARK: - Gradient subView for display label title
    override func layoutSubviews() {
        super.layoutSubviews()
        containerLabel.gradientBackground(from: UIColor.clear, to: UIColor.black, direction: GradientDirection.topToBottom)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


