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


var ToDoList: Results<Model>!



    
    
    








//func addItem(nameItem: String) {
//    ToDoList.append(["Name" : nameItem, "isCompleted" : false])
//    
//    
//    
//   
//}
//
//func removeItem(at index: Int){
//    ToDoList.remove(at: index)
//    
//    
//}

func changeState(at item: Int) -> Bool{
    try! realm.write {
    ToDoList[item]["isCompleted"] = !(ToDoList[item]["isCompleted"] as! Bool)
    }
    
    return ToDoList[item]["isCompleted"] as! Bool
}



