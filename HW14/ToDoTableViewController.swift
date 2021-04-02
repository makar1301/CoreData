//
//  ToDoTableViewController.swift
//  HW14
//
//  Created by mac on 25.03.2021.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ToDoRealm.shared.ToDoList = realm.objects(Model.self)
    }
    
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Создать новую задачу", message: "Введите задачу", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Выгулить собаку"
        }
        let alertButton1 = UIAlertAction(title: "Добавить", style: .default) { (create) in
            let newTask = alert.textFields![0].text
            ToDoRealm.shared.addItem(nameItem: newTask!)
            
            self.tableView.reloadData()
        }
        let alertButton2 = UIAlertAction(title: "Отмена", style: .cancel)
            
        alert.addAction(alertButton1)
        alert.addAction(alertButton2)
            
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
    }
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ToDoRealm.shared.ToDoList.count != 0 {
            return ToDoRealm.shared.ToDoList.count
        }
            return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let text = ToDoRealm.shared.ToDoList[indexPath.row]
        cell.textLabel?.text = text.task
        
        if text["isCompleted"] as? Bool == true {
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
        if editingStyle == .delete {
            ToDoRealm.shared.removeItem(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
           
        }    
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if ToDoRealm.shared.changeState(at: indexPath.row) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
    }
}
