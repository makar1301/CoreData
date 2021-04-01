//
//  Persistance.swift
//  HW14
//
//  Created by mac on 25.03.2021.
//

import Foundation

class Persistance {
    static let shared = Persistance()
    private let kUserNameKey = "Persistance.kUserNameKey"
    private let kUserSecondNameKey = "Persistance.kUserSecondNameKey"
    
    var userName: String? {
        set{ UserDefaults.standard.set(newValue, forKey: kUserNameKey) }
        get { return UserDefaults.standard.string(forKey: kUserNameKey)}
    }
    
    var userSecondName: String? {
        set{ UserDefaults.standard.set(newValue, forKey: kUserSecondNameKey) }
        get { return UserDefaults.standard.string(forKey: kUserSecondNameKey)}
    }
}
