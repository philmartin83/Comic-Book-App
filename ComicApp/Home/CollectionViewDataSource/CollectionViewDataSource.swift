//
//  CollectionViewDataSource.swift
//  ComicApp
//
//  Created by Phil Martin on 10/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit
import SDWebImage

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var updateUIWithData: ((Error?) -> Void)?
    var characterData: CharacterBaseData?
    
    func fetchData(){
        let request = RequestHandler().getCharacters()
        JSONDecoder().decoderWithRequest(CharacterBaseData.self, fromURLRequest: request) { [weak self] (result, error) in
            if let weakSelf = self{
                weakSelf.characterData = result
                weakSelf.updateUIWithData?(error)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterData?.apiDataSource?.numberOfCharacter ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let characters = characterData?.apiDataSource?.characters?[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Characters", for: indexPath) as! CharacterCollectionViewCell
        let path = "\(characters?.thumbnail?.path ?? "").\(characters?.thumbnail?.fileExtension ?? "")"
        cell.heroImage.sd_setImage(with: URL(string: path), placeholderImage: nil, options: .continueInBackground, context: nil)
        cell.name.text = characters?.name
        return cell
    }
}
