//
//  CharacterDetailPresenter.swift
//  ComicApp
//
//  Created by Philip Martin on 29/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit

class CharacterDetailPresenter{
    
    weak var controller: CharacterDetailViewController?
    var characterDataSource = CharacterDetailTableViewDataSource()
    var characterTableViewDelegate = CharacterDetailTableViewDelegate()
    
    var characterDetailTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .white // not supporting dark mode currently
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    func configureNavigationBar(){
        
        controller?.navigationController?.navigationBar.barStyle = .default
        controller?.navigationController?.navigationItem.hidesBackButton = true
        let navBar = controller?.navigationController?.navigationBar
        navBar?.barTintColor = .yellow
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = false
        
        let label = UILabel()
        label.text = "Character Information"
        label.textColor = .black
        label.font = UIFont(name: heroFontName, size: 20)
        label.applyShadow(shadowColour: .white)
        
        let backButton = UIButton(type: .custom)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = .black
        let image = UIImageView(image: UIImage(named: "BackButton")?.withRenderingMode(.alwaysTemplate))
        image.tintColor = .white
        backButton.setImage(image.image, for: .normal)
        backButton.addTarget(controller?.interactor, action: #selector(controller?.interactor.popViewController), for: .touchUpInside)
        backButton.applyShadow(shadowColour: .white)
        
        let item1 = UIBarButtonItem(customView: backButton)
        
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
        fixedSpace.width = 10.0
        let item2 = UIBarButtonItem(customView: label)
        controller?.navigationItem.leftBarButtonItems = [item1, fixedSpace, item2]
    }
    
    func displayLayout(){
        
        guard let controller = controller else {return}
        controller.view.addSubview(characterDetailTableView)
        characterDetailTableView.dataSource = characterDataSource
        characterDetailTableView.delegate = characterTableViewDelegate
        characterDataSource.fetchDataFromSelectedArray(character: controller.character)
        characterDetailTableView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor).isActive = true
        characterDetailTableView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor).isActive = true
        characterDetailTableView.topAnchor.constraint(equalTo: controller.view.topAnchor).isActive = true
        characterDetailTableView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        characterDetailTableView.register(CharacterHeaderTableViewCell.self, forCellReuseIdentifier: "CharacterHeader")
        
    }
}

