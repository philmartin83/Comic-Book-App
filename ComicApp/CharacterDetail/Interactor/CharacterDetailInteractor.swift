//
//  CharacterDetailInteractor.swift
//  ComicApp
//
//  Created by Philip Martin on 29/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit

class CharacterDetailInteractor{
    weak var controller: CharacterDetailViewController?
    
    @objc func popViewController(){
        controller?.navigationController?.popViewController(animated: true)
    }
}
