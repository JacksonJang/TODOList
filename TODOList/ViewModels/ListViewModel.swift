//
//  ListViewModel.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/03.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items:[ListItemModel] = []
    
    init() {
        
    }
    
    private func getList() {
        print("getList()")
    }
    
    private func saveList() {
        
    }
}
