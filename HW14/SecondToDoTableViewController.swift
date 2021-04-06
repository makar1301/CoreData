//
//  SecondToDoTableViewController.swift
//  HW14
//
//  Created by mac on 27.03.2021.
//

import UIKit


class SecondToDoTableViewController: UITableViewController {

    
    override func  viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ToDoCore.shared.loadingCoreData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func edit2Button(_ sender: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
    }
    
    @IBAction func add2Button(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Создать новую задачу", message: "Введите задачу", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Выгулить собаку"
        }
        let alertButton1 = UIAlertAction(title: "Добавить", style: .default) { (create) in
            let newTask = alert.textFields![0].text
            
            
            ToDoCore.shared.add2Item(nameItem: newTask!)
            self.tableView.reloadData()
        }
        let alertButton2 = UIAlertAction(title: "Отмена", style: .cancel)
            
        alert.addAction(alertButton1)
        alert.addAction(alertButton2)
            
        present(alert, animated: true, completion: nil)
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoCore.shared.SecondToDoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondToDoCell", for: indexPath)

        let text = ToDoCore.shared.SecondToDoList[indexPath.row]
        cell.textLabel?.text = text.task
        if text.isCompleted == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    

    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let item = ToDoCore.shared.SecondToDoList[indexPath.row]
        if editingStyle == .delete {
            
            ToDoCore.shared.remove2Item(at: indexPath.row, item: item)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

  
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

}
