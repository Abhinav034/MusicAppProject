//
//  FavouriteViewController.swift
//  MusicApp
//
//  Created by Abhinav Bhardwaj on 2019-11-28.
//  Copyright © 2019 Abhinav Bhardwaj. All rights reserved.
//

import UIKit


var favList = [Int]()

class FavouriteViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate {
    
    

    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tblView: UITableView!
    
    var isAdding = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isAdding{
            return songs.count
           
        }
        else{
            return favList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        if isAdding {
        cell.textLabel?.text = songs[indexPath.row].name
        cell.imageView?.image = UIImage(named: "AudioIcon.png")
        if (favList.contains(indexPath.row)) {
            cell.accessoryType = .checkmark
        }
        } else {
            if (favList.count > 0) {
                cell.textLabel?.text = songs[favList[indexPath.row]].name
                cell.imageView?.image = UIImage(named: "AudioIcon.png")
            }
        }
        
            return cell
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isAdding {
            if (favList.contains(indexPath.row)) {
                favList = favList.filter {$0 != indexPath.row}
            } else {
                favList.append(indexPath.row)
            }
            tblView.reloadData()
            
        }
        
        else {
            currSong = favList[indexPath.row]
            performSegue(withIdentifier: "segue", sender: self)
        }
        
        
        
    }
    

    
     @IBAction func addButtonPressed(_ sender: UIButton) {
        
        if isAdding{
            
            addButton.setTitle("Add", for: .normal)
            
        }else{
            addButton.setTitle("Done", for: .normal)
            
        }
        isAdding = !isAdding
        tblView.reloadData()
        
     }
     
   

}
