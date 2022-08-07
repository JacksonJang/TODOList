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
}
