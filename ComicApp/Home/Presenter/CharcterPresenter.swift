//
//  CharcterPresenter.swift
//  ComicApp
//
//  Created by Phil Martin on 10/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit


class CharaterPresenter: NSObject, UICollectionViewDelegate {
    
    weak var controller: CharacterListViewController?
    private let dataSource = CollectionViewDataSource()
    
    var collectionView: UICollectionView = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.size.width)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 5.0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    func configureNavigationBar(){
        controller?.navigationController?.navigationBar.barStyle = .black
        let navBar = controller?.navigationController?.navigationBar
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = false
        navBar?.barTintColor = .red
        
        let leftTitle = UILabel()
        leftTitle.font = UIFont(name: heroFontName, size: titleFontSize)
        leftTitle.text = "Comic Characters"
        leftTitle.textColor = .white // we can add some custom colours later
        leftTitle.applyShadow(shadowColour: .black)
        controller?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftTitle)
    }
    
    func displayLayout(){
        guard let controller = controller else {return} // could add an alertview view
        controller.view.addSubview(collectionView)
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "Characters")
        collectionView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: controller.view.topAnchor).isActive = true
        collectionView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        fetchData()
    }
    
    //MARK:- Helper
    fileprivate func fetchData(){
        dataSource.fetchData()
        dataSource.updateUIWithData = { [weak self] (error) in
            if error == nil{
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }
    
    //MARK:- CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let character = dataSource.characterData?.apiDataSource?.characters?[indexPath.item]
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.animateButtonPress()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            let detailViewController = CharacterDetailViewController()
            detailViewController.character = character
        self?.controller?.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    
}
