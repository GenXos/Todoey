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
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - IBActions
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if textField.text != "" {
                self.itemArray.append(textField.text!)
            }
            self.tableView.reloadData()
            print("\(self.itemArray)")
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
}

// MARK: - TableView DataSource Methods
extension TodoListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
}

// MARK: - TableView Delegate Methods
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


















