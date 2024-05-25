//
//  SideBar.swift
//  Iris-Demo
//
//  Created by Primpraow Mulling on 5/22/24.
//

import SwiftUI

struct SideBar: View {
    
    @Binding var isSidebarVisible: Bool
    
    var body: some View {
        if isSidebarVisible {
            Text("side bar visible")
                .bold()
                .font(.largeTitle)
        }
    }
}

//#Preview {
//   SideBar(isSidebarVisible)
//}
