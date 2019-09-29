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
    
    var characterID: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.controller = self
        presenter.configureNavigationBar()
        presenter.displayLayout()
        interactor.controller = self
        // Do any additional setup after loading the view.
    }
}
