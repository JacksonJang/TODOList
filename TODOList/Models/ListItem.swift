//
//  ListItem.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/07.
//

import Foundation

struct ListItem: Codable, Identifiable {
    let id: String
    let title: String
    let isCheck: Bool
    
    init(id:String = UUID().uuidString, title:String, isCheck:Bool){
        self.id = id
        self.title = title
        self.isCheck = isCheck
    }
}
