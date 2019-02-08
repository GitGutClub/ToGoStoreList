//
//  ViewController.swift
//  ToGoStoreList
//
//  Created by MacOS on 05.02.2019.
//  Copyright © 2019 GZ. All rights reserved.
//

import UIKit

class ToGoViewController: UITableViewController  {

    var itemArray = ["Milk", "kek", "Cheburek"]
   
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = defaults.array(forKey: "ToDoList") as? [String]{
            itemArray = item
        }
    }

   //MARK- Tabletvie database Methods
    //TODO: Declare numberOfRowsInSection here:
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToGoCell", for: indexPath)
        
        cell.textLabel?.text = self.itemArray[indexPath.row]
        
        
        return cell
    }
    
    //MARK - Delegate method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        print("\(itemArray[indexPath.row])")
    }
    //MARK - Add new items    
    
    @IBAction func addNewItemPressd(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New ToDO item", message: "", preferredStyle: .alert)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            //what will hapen when used click
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "ToDoList")
           self.tableView.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
