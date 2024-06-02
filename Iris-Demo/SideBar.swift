//
//  SideBar.swift
//  Iris-Demo
//
//  Created by Primpraow Mulling on 5/22/24.
//

import SwiftUI

struct SideBar: View {
    
    @Binding var isSidebarVisible: Bool
    
//    /* Color Schemes */
//    let lightColor("dark_purple") = Color(red: 176/255, green: 166/255, blue: 203/255, opacity: 1.0)
//    let Color("dark_purple") = Color(red: 97/255, green: 77/255, blue: 150/255, opacity: 1.0)
//    let pastelColor("dark_purple") = Color(red: 136/255, green: 121/255, blue: 176/255, opacity: 0.1)
    
    var body: some View {
        if isSidebarVisible {
            
            ZStack {
                HStack {
                    //left view
                    NavigationStack {
                        Text("Home")
                        Text("My Inventory")
                        Text("History")
                        Text("Batches")
                        Text("Receiving")
                        Text("outgoing")
                        Text("Setting")
                        Text("Help")
                        .background(Color.white)
                    }
                    //right view
                    //                NavigationStack {
                    ////                    .searchable()
                    //                    .background(pastelColor("dark_purple"))
                    //                }
                }
            }
            
        }
    }
}

//#Preview {
//   SideBar(isSidebarVisible)
//}
