//
//  SwiftUIView.swift
//  Iris-Demo
//
//  Created by Primpraow Mulling on 5/29/24.
//

import SwiftUI

struct NavView: View {
    /* Side bar*/
    @State private var isSideBarOpened: Bool = false
    @Binding var isSidebarVisible: Bool
    
    /* Color Schemes
        -light_Color("dark_purple")
        -medium_Color("dark_purple")
        -dark_Color("dark_purple")
    */
  
    
    var body: some View {
        
        
        ZStack {
            NavigationStack {
                Text("")
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
                        
                        
                        ToolbarItem(placement: .topBarTrailing){
                            HStack{
                                
                                NavigationLink(destination: ContentView()) {
                                    Text("Home")
                                        .foregroundColor(Color("dark_purple"))
                                }
                                
                                Button(action: {
                                    print("show edit view")
                                }, label: {
                                    Image(systemName: "gearshape")
                                        .foregroundColor(Color("dark_purple"))
                                        .imageScale(.large)
                                        .foregroundStyle(.tint)
                                })
                                
                                
                                
                            }
                            
                        }
                    }
                    .padding(.top, -20)
            }
            
            /*side bar*/
            SideBar(isSidebarVisible: $isSideBarOpened )
        }
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.red.opacity(0.6))
            .opacity(isSideBarOpened ? 1 : 0)
            .animation(.easeInOut.delay(0.01), value: isSideBarOpened)
            .onTapGesture {
                isSideBarOpened.toggle()
            }
            .edgesIgnoringSafeArea(.all)
                    
        }
}
 

//#Preview {
//    NavigationView()
//}

