//
//  ViewExt.swift
//  TODOList
//
//  Created by 장효원 on 2022/08/04.
//

import SwiftUI

extension View {
    func navigatePush(whenTrue toggle: Binding<Bool>) -> some View {
        NavigationLink(
            destination: self,
            isActive: toggle
        ) { EmptyView() }
    }
}
