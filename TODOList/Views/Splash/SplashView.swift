//
//  SplashView.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/03.
//

import SwiftUI

struct SplashView: View {
    @StateObject var listViewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            MainListView()
                .environmentObject(listViewModel)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
