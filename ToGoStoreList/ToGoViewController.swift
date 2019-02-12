//
//  ViewController.swift
//  ToGoStoreList
//
//  Created by MacOS on 05.02.2019.
//  Copyright © 2019 GZ. All rights reserved.
//

import UIKit

class ToGoViewController: UITableViewController  {

    var itemArray = [Item]()
   
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = defaults.array(forKey: "ToDoList") as? [Item]{
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
        let item = self.itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.flag == false ? .none : .checkmark
        
        return cell
    }
    
    //MARK - Delegate method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        itemArray[indexPath.row].flag = !itemArray[indexPath.row].flag
        
        
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
            let item = Item()
            item.title = textField.text!
            self.itemArray.append(item)
            self.defaults.set(self.itemArray, forKey: "ToDoList")
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
