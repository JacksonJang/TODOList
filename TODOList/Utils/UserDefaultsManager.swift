//
//  UserDefaultsManager.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/03.
//

import Foundation

class UserDefaultsManager: NSObject {
    static let shared = UserDefaultsManager()
    
    func save(type:UserDefaultsType, value:Any) {
        UserDefaults.standard.set(value, forKey: type.rawValue)
    }
}

enum UserDefaultsType:String {
    case MAINLIST
}
