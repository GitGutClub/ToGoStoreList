//
//  ViewController.swift
//  ToGoStoreList
//
//  Created by MacOS on 05.02.2019.
//  Copyright © 2019 GZ. All rights reserved.
//

import UIKit

class ToGoViewController: UITableViewController  {

    let itemArray = ["Milk", "kek", "Cheburek"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        self.tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        print("\(itemArray[indexPath.row])")
        
        
    }
}
