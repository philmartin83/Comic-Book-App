//
//  CharacterDetailViewController.swift
//  ComicApp
//
//  Created by Philip Martin on 29/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var presenter = CharacterDetailPresenter()
    var interactor = CharacterDetailInteractor()
    
    var character: Character?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        presenter.controller = self
        presenter.displayLayout()
        interactor.controller = self
        
        let baseNavigationController = navigationController as? BaseNavigationViewController
        baseNavigationController?.applyStyling(navTitle: "Character Details", shouldAddBackButton: true, viewController: self)
    }
}
