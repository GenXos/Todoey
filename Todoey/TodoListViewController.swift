//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Todd Fields on 2018-08-28.
//  Copyright © 2018 SKULLGATE Studios. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    // MARK: - Variables
    let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

// MARK: - TableView DataSource Methods
extension TodoListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
}

// MARK - TableView Delegate Methods
extension TodoListViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)
        
        if currentCell?.accessoryType == .checkmark {
            currentCell?.accessoryType = .none
        } else {
            currentCell?.accessoryType = .checkmark
        }
        
        if let currentItem = currentCell?.textLabel?.text {
        
            print("\(currentItem)")
        }
        
        tableView.deselectRow(at: indexPath!, animated: true)
    }
}


















