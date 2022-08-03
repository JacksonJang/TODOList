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
    @State var opacity:CGFloat = 0.1
    
    let splashView = SplashView()
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {_ in
            self.opacity += 0.01
            
            if self.opacity == 1.0 {
                timer.invalidate()
            }
        }
    }
    
    var body: some View {
        NavigationView{
            if isRun {
                MainListView()
                    .environmentObject(listViewModel)
                    .navigationBarHidden(true)
            } else {
                splashView
                    .navigationBarHidden(true)
                    .opacity(opacity)
            }
        }
        .onAppear(){
            print("MainView onAppear")
            _ = timer
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
