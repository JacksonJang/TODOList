//
//  MainListView.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/03.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
