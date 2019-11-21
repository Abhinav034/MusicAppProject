//
//  GenreCollectionController.swift
//  MusicApp
//
//  Created by Abhinav Bhardwaj on 2019-11-20.
//  Copyright © 2019 Abhinav Bhardwaj. All rights reserved.
//

import UIKit
var selectedGener = ""

class GenreCollectionController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

   
  var genreList = [String]()


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       var totalGenres = 0
              
              for song in songs {
                  
                  if (!genreList.contains(song.genre)) {
                      genreList.append(song.genre)
                      totalGenres = totalGenres + 1
                  }
                  
              }
              return totalGenres
              
          
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    
        cell.viewname.text = songs[indexPath.row].genre
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedGener = songs[indexPath.row].genre
        performSegue(withIdentifier: "segue", sender: self)
        
        
    }

}
