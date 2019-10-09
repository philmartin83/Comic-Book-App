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
    var character: Character?
    
    func fetchDataFromSelectedArray(character: Character?){
        self.character = character
        updateUI?()
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
            let imagePath = "\(character?.thumbnail?.path ?? "").\(character?.thumbnail?.fileExtension ?? "")"
            cell.profileImage.sd_setImage(with: URL(string: imagePath), completed: nil)
            cell.nameOfHero.text = character?.name
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterDescriptionCell", for: indexPath) as! CharacterDescriptionTableViewCell
            if character?.description == ""{
                cell.descriptionLabel.text = "No character description."
            }else{
                cell.descriptionLabel.text = character?.description
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterComics", for: indexPath) as! CharacterComicTableViewCell
            cell.dataSource.fetchComicData(series: character?.comics?.collectionURI)
            return cell
        }
    }
}
