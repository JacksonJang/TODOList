//
//  ListViewModel.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/03.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items:[ListItemModel] = [
        ListItemModel(id: 1, title: "test", content: "content"),
        ListItemModel(id: 2, title: "test2", content: "content2"),
        ListItemModel(id: 3, title: "test3", content: "content3")
    ]
    
    init() {
        
    }
    
    private func getList() {
        print("getList()")
    }
    
    private func saveList() {
        
    }
}
