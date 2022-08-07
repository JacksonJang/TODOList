//
//  TODOListApp.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/07.
//

import SwiftUI

@main
struct TODOListApp: App {
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
