//
//  ComicBookCollectionViewCell.swift
//  ComicApp
//
//  Created by Philip Martin on 07/10/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit

class ComicBookCollectionViewCell: UICollectionViewCell {
    
    var activity = ActivityIndicator()
    
    var comicBookCover: UIImageView = {
        let cover = UIImageView()
        cover.contentMode = .scaleAspectFill
        cover.clipsToBounds = true
        cover.layer.masksToBounds = true
        cover.translatesAutoresizingMaskIntoConstraints = false
        return cover
    }()
    
    var comicTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: heroFontName, size: 17)
        title.textColor = .black
        title.numberOfLines = 0
        title.textAlignment = .center
        return title
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.tintColor = .black
        activity.color = .black
        return activity
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        self.clipsToBounds = true
        contentView.applyShadow(shadowColour: .black)
        displayCellContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func displayCellContent(){
        
        contentView.addSubview(comicBookCover)
        comicBookCover.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        comicBookCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        comicBookCover.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        comicBookCover.heightAnchor.constraint(lessThanOrEqualToConstant: 160).isActive = true

        
        contentView.addSubview(comicTitle)
        comicTitle.topAnchor.constraint(equalTo: comicBookCover.bottomAnchor, constant: 15).isActive = true
        comicTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        comicTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        contentView.bottomAnchor.constraint(equalTo: comicTitle.bottomAnchor).isActive = true
        
        activity.displayActivity(view: contentView)
        
    }
    
}
