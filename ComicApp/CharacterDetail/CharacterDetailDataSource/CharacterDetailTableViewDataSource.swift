//
//  CharacterDetailTableViewDataSource.swift
//  ComicApp
//
//  Created by Philip Martin on 29/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit

class CharacterDetailTableViewDataSource: NSObject, UITableViewDataSource{
    
    var updateUI:(()-> Void)?
    
    func fetchCharacterData(characterID: Int?){
        guard let id = characterID else {return} // return an alert view explaning coukd get character id
        let request = RequestHandler().getCharacterByID(id: id)
        JSONDecoder().decoderWithRequest(ComicData.self, fromURLRequest: request) { (result, error) in
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterHeader", for: indexPath) as! CharacterHeaderTableViewCell
            return cell
        }
//        else if indexPath.section == 1{
//
//        }else{
//
//        }
        
        return UITableViewCell()
    }
}
