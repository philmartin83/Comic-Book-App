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
    var comicData: ComicData?
    
    func fetchData(){
        let request = RequestHandler().getCharacters()
        JSONDecoder().decoderWithRequest(ComicData.self, fromURLRequest: request) { [weak self] (result, error) in
            if let weakSelf = self{
                weakSelf.comicData = result
                weakSelf.updateUIWithData?(error)
            }
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let characterCount = comicData?.apiDataSource?.numberOfCharacter else {return 0}
        return characterCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let characters = comicData?.apiDataSource?.characters?[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Characters", for: indexPath) as! CharacterCollectionViewCell
        let path = "\(characters?.thumbnail?.path ?? "").\(characters?.thumbnail?.fileExtension ?? "")"
        cell.heroImage.sd_setImage(with: URL(string: path), placeholderImage: nil, options: .continueInBackground, context: nil)
        return cell
    }
    
    
    
    
}
