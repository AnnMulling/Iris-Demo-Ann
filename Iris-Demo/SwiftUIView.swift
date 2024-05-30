//
//  SwiftUIView.swift
//  Iris-Demo
//
//  Created by Primpraow Mulling on 5/29/24.
//

import SwiftUI

struct NavigationView: View {
    /* Side bar*/
    @State private var isSideBarOpened: Bool = false
    
    /* Color Schemes 
        -light_Color("dark_purple")
        -medium_Color("dark_purple")
        -dark_Color("dark_purple")
    */
  
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("")
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    /* hamburger toggle */
                    Button (action: {
                        isSideBarOpened.toggle()
                        print(isSideBarOpened)
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(Color("dark_purple"))
                            .imageScale(.large)
                    })
                }
            }
        }
    }
}

#Preview {
    NavigationView()
}
