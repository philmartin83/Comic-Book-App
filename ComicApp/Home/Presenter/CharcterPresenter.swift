//
//  CharcterPresenter.swift
//  ComicApp
//
//  Created by Phil Martin on 10/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit


class CharaterPresenter {
    
    weak var controller: CharacterListViewController?
    private let dataSource = CollectionViewDataSource()
    
    var collectionView: UICollectionView = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.size.width)
//        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 5.0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    func configureNavigationBar(){
        let navBar = controller?.navigationController?.navigationBar
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = false
        navBar?.barTintColor = .red
        
        let leftTitle = UILabel()
        leftTitle.font = UIFont.boldSystemFont(ofSize: 17)
        leftTitle.text = "Comic Characters"
        leftTitle.textColor = .white // we can add some custom colours later
        controller?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftTitle)
    }
    
    func displayLayout(){
        guard let controller = controller else {return} // could add an alertview view
        controller.view.addSubview(collectionView)
        collectionView.dataSource = dataSource
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "Characters")
        collectionView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: controller.view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor).isActive = true
        fetchData()
    }
    
    //MARK:- Helper
    private func fetchData(){
        dataSource.fetchData()
        
        dataSource.updateUIWithData = { [weak self] (error) in
            if error == nil{
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
           
        }
    }
    
}
