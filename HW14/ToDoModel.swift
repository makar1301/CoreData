//
//  ToDoModel.swift
//  HW14
//
//  Created by mac on 25.03.2021.
//

import Foundation
import RealmSwift

class Model: Object {
    @objc dynamic var task = String()
    @objc dynamic var isCompleted = Bool()
}
let realm = try! Realm()

class ToDoRealm {
    static let shared = ToDoRealm()
 
var ToDoList: Results<Model>!

func addItem(nameItem: String) {
    let tasks = Model()
    tasks.isCompleted = false
    tasks.task = nameItem
    try! realm.write() {
    realm.add(tasks)
    print(tasks)
    }
}

func removeItem(at index: Int){
    let text = ToDoList[index]
    try! realm.write { realm.delete(text) }
}

func changeState(at item: Int) -> Bool{
    try! realm.write {
    ToDoList[item]["isCompleted"] = !(ToDoList[item]["isCompleted"] as! Bool)
    }
    return ToDoList[item]["isCompleted"] as! Bool
}

}
