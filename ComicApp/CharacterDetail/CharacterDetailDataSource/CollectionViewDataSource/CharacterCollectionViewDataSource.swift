//
//  CharacterCollectionViewDataSource.swift
//  ComicApp
//
//  Created by Philip Martin on 07/10/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import UIKit

final class CharacterCollectionViewDataSource: NSObject, UICollectionViewDataSource{
    
    var comics: ComicBaseData?
    var comicSeries: CharacterComics?
    
    var updateCollectionView: (()-> Void)?
    
    func fetchComicData(id: Int?){
        guard let id = id else {return}
        let request = RequestHandler().getComics(id: id)
        JSONDecoder().decoderWithRequest(ComicBaseData.self, fromURLRequest: request) { [weak self] (result, error) in
            if let weakSelf = self{
                weakSelf.comics = result
                weakSelf.updateCollectionView?()
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comics?.apiDataSource?.comics?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComicBooksCell", for: indexPath) as! ComicBookCollectionViewCell
        let item = comics?.apiDataSource?.comics?[indexPath.item]
        cell.setData(comic: item)
        return cell
    }
}
