//
//  MusicListControllerTableViewController.swift
//  MusicApp
//
//  Created by Abhinav Bhardwaj on 2019-11-20.
//  Copyright © 2019 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

var songs = [Song]()
var currSong = 0

class MusicListControllerTableViewController: UITableViewController {
    
    
    var search = [String]()
    var searching = false
    var sngList = [String]()
    
    
    
    var songList = [["Most_Epic_Music_Ever_The_Wolf_And_The_Moon", "Jazz"], ["Sub_Urban_Cradles", "Rock"], ["Zedd_KatyPerry_365", "Pop"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        var i = 0
        for song in songList {
            
            songs.append(Song(songNumber : i, name : song[0], genre: song[1]))
            sngList.append(song[0])
            i = i + 1
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if (searching){
                   if (indexPath.row < search.count){
                       cell.textLabel?.text = search[indexPath.row]
                       cell.imageView?.image = UIImage(named: "AudioIcon.png")
                   }
               } else {
                   cell.textLabel?.text = songs[indexPath.row].name
                   cell.imageView?.image = UIImage(named: "AudioIcon.png")
               }
               
               
               return cell

    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currSong = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    

}
