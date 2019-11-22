//
//  CustomListTableViewController.swift
//  MusicApp
//
//  Created by Abhinav Bhardwaj on 2019-11-22.
//  Copyright © 2019 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

class CustomListTableViewController: UITableViewController {

    var ListName = [String]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    func alert(){
        
        
        let alert = UIAlertController(title: "Custom List", message: "Enter a name for this list", preferredStyle: .alert)

                      
                      alert.addTextField { (textField) in
                          textField.text = ""
                      }
                   
               

                      alert.addAction(UIAlertAction(title: "Add List", style: .default, handler: { [weak alert] (_) in
                       
                       let textField = alert?.textFields![0]
                       
                        
                        
                       
                        self.ListName.append(textField!.text!) // Getting List names on the tap of add item
                        
                        self.tableView.reloadData()
                       
                       
                          
                      }))
               alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in
                   
                   
                  alert?.dismiss(animated: true, completion: nil)
                   
                   
               }))

                      
                      self.present(alert, animated: true, completion: nil)
              
        
    }
    
    
    @IBAction func AddPressed(_ sender: UIBarButtonItem) {
        
       alert()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        alert()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ListName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = ListName[indexPath.row]
        cell.detailTextLabel?.text = "Number of songs: "
        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
