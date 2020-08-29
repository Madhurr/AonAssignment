//
//  ViewController.swift
//  TodoAssignment
//
//  Created by madhur on 28/08/20.
//  Copyright © 2020 Unilancer Corporation Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
  
    @IBOutlet weak var todoTableView: UITableView!

    var todos: [String] = ["Start adding Your Task"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.rowHeight = 80
    }
    
    
    // Table View Protocols
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoCell
        cell.tasklabel.text = todos[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TodoCell
        if cell.isCheck == false{
            cell.doneImg.image = UIImage(named: "icons8-checkmark-64")
            cell.isCheck = true
        }else{
            cell.doneImg.image = nil
            cell.isCheck = false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todos.remove(at: indexPath.row)
            todoTableView.reloadData()
        }
    }
    
    

    @IBAction func addTapped(_ sender: Any) {
        let todoAlert = UIAlertController(title: "Add Todo", message: "Add a new Todo", preferredStyle: .alert)
        todoAlert.addTextField()
        
        let addTodoAction = UIAlertAction(title: "Add", style: .default ){ (action) in
            let newTodo = todoAlert.textFields![0]
            
            self.todos.append(newTodo.text!)
            self.todoTableView.reloadData()
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        todoAlert.addAction(cancelAction)
        todoAlert.addAction(addTodoAction)
        
        present(todoAlert, animated: true)
    }
    
}

