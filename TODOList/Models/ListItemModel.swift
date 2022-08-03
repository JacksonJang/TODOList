//
//  ListItemModel.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/03.
//

import Foundation

struct ListItemModel: Codable {
    let id: Int
    let title: String
    let content: String
}
