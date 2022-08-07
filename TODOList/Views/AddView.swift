//
//  AddView.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/07.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var viewModel:ListViewModel
    
    @State var todoInputString:String = ""
    @State var showAlert:Bool = false
    
    var body: some View {
        VStack {
            HStack {
                //Input
                HStack{
                    TextField("TODO를 입력해 주세요.", text: $todoInputString)
                        .frame(height:50)
                        .padding(.horizontal)
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()
                
                //Button
                HStack{
                    Button(action: {
                        save()
                    }, label: {
                        Text("저장")
                            .foregroundColor(Color.white)
                            .padding(.horizontal)
                    })
                    .frame(width:75,height:50)
                }
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.trailing, 15)
                
            }
            
            Spacer()
        }
        .navigationTitle("할 일 등록")
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("TODO를 입력해 주세요."))
        })
    }
}

extension AddView {
    func save() {
        if isValidation() {
            self.showAlert = true
            return
        }
        
        let item = ListItem(title: self.todoInputString, isCheck: false)
        
        self.viewModel.saveItem(item: item) {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    private func isValidation() -> Bool {
        return self.todoInputString == ""
    }
}

struct AddView_Previews: PreviewProvider {
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
        NavigationView{
            AddView()
        }
        .environmentObject(viewModel)
    }
}
