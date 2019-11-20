//
//  GenreTableViewController.swift
//  MusicApp
//
//  Created by Abhinav Bhardwaj on 2019-11-20.
//  Copyright © 2019 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

class GenreTableViewController: UITableViewController {
    
    var songNumbers = [Int]()
    var songNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
              var i = 0
              for song in songs {
                  
                  
                  if song.genre == selectedGener {
                      songNumbers.append(i)
                      songNames.append(song.name)
                      count = count+1
                  }
                  i = i + 1
                  
              }
       return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = songNames[indexPath.row]
        cell.imageView?.image = UIImage(named: "AudioIcon.png")
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                currSong = songNumbers[indexPath.row]
               performSegue(withIdentifier: "segue", sender: self)
    }

}
