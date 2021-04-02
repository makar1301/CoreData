//
//  SecondToDoModel.swift
//  HW14
//
//  Created by mac on 27.03.2021.
//
import UIKit
import Foundation
import CoreData


class ToDoCore {

    static let shared = ToDoCore()
    
var SecondToDoList: [TasksCoreData] = []

// Добавление новой задачи
func add2Item(nameItem: String) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    guard let entity = NSEntityDescription.entity(forEntityName: "TasksCoreData", in: context) else {return}
    let taskObject = TasksCoreData(entity: entity, insertInto: context)
    taskObject.task = nameItem
    taskObject.isCompleted = false
    
    do {
        try context.save()
        SecondToDoList.append(taskObject)
    } catch let error as NSError {
        print(error.localizedDescription)
    }
    
}
// Удаление задачи
func remove2Item(at index: Int, item: TasksCoreData){
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let fenchRequest: NSFetchRequest<TasksCoreData> = TasksCoreData.fetchRequest()
    if let tasks = try? context.fetch(fenchRequest) {
            context.delete(tasks[index])
        SecondToDoList.remove(at: index)
        do {
            try context.save()
           
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

}
