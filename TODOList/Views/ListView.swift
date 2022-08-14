//
//  ListView.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/07.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel:ListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.items){ item in
                Text(item.title)
            }
            .onDelete(perform: { indexSet in
                remove(indexSet: indexSet)
            })
            .onMove(perform: { indexSet, toIndex in
                move(from: indexSet, to: toIndex)
            })
        }
        .navigationTitle("메모 리스트")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("추가",
            destination: AddView())
        )
        .listStyle(.plain)
    }
    
    func remove(indexSet: IndexSet) {
        self.viewModel.removeItem(indexSet: indexSet)
    }
    
    func move(from indexSet:IndexSet,to toIndex:Int) {
        self.viewModel.move(indexSet: indexSet, toIndex: toIndex)
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
