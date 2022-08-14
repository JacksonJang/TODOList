//
//  ListViewModel.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/07.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ListItem] = []
    
    init() {
        getItems()
    }
    
    private func getItems() {
        self.items = UserDefaultsManager.shared.getMemoList()
    }
    
    public func saveItem(item:ListItem, completion:(()->Void)? = nil) {
        self.items.append(item)
        
        if let data = try? JSONEncoder().encode(items) {
            UserDefaultsManager.shared.save(type: .memoList, value: data)
            print("Register todo : \(item.title)")
            completion?()
        } else {
            print("Failed to save")
        }
    }
    
    public func removeItem(indexSet:IndexSet, completion:(()->Void)? = nil) {
        self.items.remove(atOffsets: indexSet)
        
        if let data = try? JSONEncoder().encode(items) {
            UserDefaultsManager.shared.save(type: .memoList, value: data)
            print("data : \(String(data: data, encoding: .utf8))")
            completion?()
        } else {
            print("Failed to remove")
        }
    }
    
    public func move(indexSet:IndexSet, toIndex:Int, completion:(()->Void)? = nil) {
        self.items.move(fromOffsets: indexSet, toOffset: toIndex)
        
        if let data = try? JSONEncoder().encode(items) {
            UserDefaultsManager.shared.save(type: .memoList, value: data)
            print("data : \(String(data: data, encoding: .utf8))")
            completion?()
        } else {
            print("Failed updateItems")
        }
    }
}
