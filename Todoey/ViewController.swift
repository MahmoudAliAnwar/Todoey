//
//  ViewController.swift
//  Todoey
//
//  Created by mahmoud ali on 5/10/19.
//  Copyright © 2019 mahmoud ali. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
   var itemarry=["find mike","buyeggos","destory demogo"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // tableview datasource method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemarry.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=itemarry[indexPath.row]
        return cell
    }
    // tableview delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(indexPath.row)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // choose the cell on flash
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //add new item
    @IBAction func addbuttonpress(_ sender: UIBarButtonItem) {
         var textfiled = UITextField()
        let alert=UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action=UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happn once the user clicks the Add Item button on our uialert
            self.itemarry.append(textfiled.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { (alerttextfiled) in
            alerttextfiled.placeholder="create new item"
            textfiled=alerttextfiled
            print(alerttextfiled.text!)
           
            
            
        }
        alert.addAction(action)
       self.present(alert,animated: true,completion: nil)
    }
    
}

