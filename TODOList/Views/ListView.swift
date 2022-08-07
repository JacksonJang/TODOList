//
//  ListView.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/07.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel:ListViewModel
    
    @State var isEditMode:EditMode = .active
    
    var body: some View {
        List {
            ForEach(viewModel.items){ item in
                Text(item.title)
            }
        }
        .environment(\.editMode, self.$isEditMode)
        .navigationTitle("메모 리스트")
        .navigationBarItems(
            trailing: NavigationLink("추가",
            destination: AddView())
        )
        .listStyle(.plain)
    }
}

struct ListView_Previews: PreviewProvider {
    static var viewModel:ListViewModel = {
        let viewModel = ListViewModel()
        
        viewModel.items = [
            ListItem(title: "test1", isCheck: true),
            ListItem(title: "test2", isCheck: false),
            ListItem(title: "test3", isCheck: true)
        ]
        
        return viewModel
    }()
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(viewModel)
    }
}
