//
//  CharacterListViewController.swift
//  ComicApp
//
//  Created by Phil Martin on 10/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    let presenter = CharaterPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        
    }
    
    fileprivate func setup(){
        view.backgroundColor = .white // use systemBackground if you wish to support dark mode in iOS 13
        presenter.controller = self
        presenter.displayLayout()
    }
    
    fileprivate func setupNavBar(){
        let navigationController = self.navigationController as? BaseNavigationViewController
        navigationController?.applyStyling(navTitle: "Comic Characters", shouldAddBackButton: false, viewController: self)
    }
}
