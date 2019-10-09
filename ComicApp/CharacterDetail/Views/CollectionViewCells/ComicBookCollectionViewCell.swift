//
//  ComicBookCollectionViewCell.swift
//  ComicApp
//
//  Created by Philip Martin on 07/10/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit

class ComicBookCollectionViewCell: UICollectionViewCell {
    
    var comicBookCover: UIImageView = {
        let cover = UIImageView()
        cover.contentMode = .scaleAspectFit
//        cover.clipsToBounds = true
        
        cover.translatesAutoresizingMaskIntoConstraints = false
        return cover
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.applyShadow(shadowColour: .black)
        displayCellContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func displayCellContent(){
        contentView.addSubview(comicBookCover)
        comicBookCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        comicBookCover.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        comicBookCover.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        comicBookCover.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
}
