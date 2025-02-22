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
    
    
    
    var songList = [["Most_Epic_Music_Ever_The_Wolf_And_The_Moon", "Pop"], ["Sub_Urban_Cradles", "Rock"], ["Zedd_KatyPerry_365", "Jazz"],["Losers", "R&b"],["The Weeknd - I Feel It Coming ft. Daft Punk (1)" , "Hip-Hop"],["The Weeknd-I Can't Feel My Face", "R&b"],["Patiala_Peg-Diljit_Dosanjh", "Punjabi"],["001. Drake feat. Wizkid & Kyla - One Dance","Pop"],["101-maroon_5-best_4_u-jrp","Jazz"],["JayZ & Linkin Park - NumbEncore - (HD)","Hip-Hop"],["triumph-fight-the-good-fight","Country"]]

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

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return  search.count
        }
        else{
            return songs.count
        }
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
        if searching {
                   if (indexPath.row < search.count){
                       cell.textLabel?.text = search[indexPath.row]
                    
                       cell.imageView?.image = UIImage(named: "AudioIcon.png")
                   }
               } else {
                   cell.textLabel?.text = songs[indexPath.row].name
                   cell.detailTextLabel?.text = "unknown artist"
                   cell.imageView?.image = UIImage(named: "AudioIcon.png")
            
               }
               
               
               return cell

    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        currSong = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    
    
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
   
}



extension MusicListControllerTableViewController: UISearchBarDelegate {
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        search = sngList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        
        searching = true
        self.tableView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        self.tableView.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searching = false
        self.searchBar.endEditing(true)
    }
   
    
    
}
