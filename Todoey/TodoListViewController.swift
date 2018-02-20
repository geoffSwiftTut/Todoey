//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Geoffrey d'Alelio on 2/9/18.
//  Copyright © 2018 Big Idea Software. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

   var itemArray = ["Find Mike", "Buy Eggos","Destroy Demogorgon"]
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }

  //mark - Tableview Datasource Methods
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return itemArray.count
   }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
   
      cell.textLabel?.text = itemArray[indexPath.row]
   
      return cell
   }

   //MARK - TableView Delegate Methods
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // print(itemArray[indexPath.row])

       //check to se if there is a checkmark already  and turn off, or set the checkmark if it doesn't
      if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
         tableView.cellForRow(at: indexPath)?.accessoryType = .none
      } else {
         tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
      }
      tableView.deselectRow(at: indexPath, animated: true)
     
   }
   
   //MARK - Add New Items
   
   @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
      
      var textField = UITextField()
      
      let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
      //action uses a closure for the process of adding for completion handler
      let action = UIAlertAction(title: "add Item", style: .default) {(action) in
         //what will happen once the user clicks the Add Item button
         
         //add new item to itemArray
         self.itemArray.append(textField.text!)
         //reload the table to display new items
         self.tableView.reloadData()
      }  //end of closure handler
      alert.addTextField { (alertTextField) in
         alertTextField.placeholder = "What do you want to add?"
         textField = alertTextField
      }
        alert.addAction(action)
   
        //show the alert to the user
         present(alert, animated:true, completion: nil)
      
   }
}

