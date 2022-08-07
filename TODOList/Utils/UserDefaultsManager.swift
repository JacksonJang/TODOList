//
//  UserDefaultsManager.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/07.
//

import Foundation

enum UserDefaultsType:String {
    case memoList = "memoList"
}

class UserDefaultsManager: NSObject {
    static let shared = UserDefaultsManager()
    
    func save(type:UserDefaultsType, value:Any) {
        UserDefaults.standard.set(value, forKey: type.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func getMemoList() -> [ListItem] {
        if let data = UserDefaults.standard.data(forKey: UserDefaultsType.memoList.rawValue) {
            guard let list = try? JSONDecoder().decode([ListItem].self, from: data) else {
                print("readMemoList JSONDecoder error")
                return []
            }
            
            return list
        } else {
            print("memoList is empty")
            return []
        }
    }
}
