//
//  MainView.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/04.
//

import SwiftUI

struct MainView: View {
    @StateObject var listViewModel = ListViewModel()
    
    @State var isRun:Bool = false
    @State var opacity:CGFloat = 0
    
    let splashTime:CGFloat = 2.5
    
    var body: some View {
        NavigationView{
            if isRun {
                MainListView()
                    .environmentObject(listViewModel)
                    .navigationBarHidden(true)
            } else {
                VStack {
                    VStack {
                        Text("Splash")
                            .font(.system(size: 50, weight: .bold))
                            .opacity(opacity)
                            
                    }
                }
                .navigationBarHidden(true)
                .onAppear(){
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut(duration: splashTime)){
                            self.opacity = 1.0
                        }
                    }
                    
                    //현재 withAnimation의 completion이 없어서 다음과 같이 진행
                    DispatchQueue.main.asyncAfter(deadline: .now() + splashTime + 2.0) {
                        self.isRun = true
                    }
                }
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
