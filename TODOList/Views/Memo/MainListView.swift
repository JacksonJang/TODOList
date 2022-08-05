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
        VStack{
            List(listViewModel.items){ item in
                VStack {
                    Text(item.title)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
