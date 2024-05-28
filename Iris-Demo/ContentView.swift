//
//  ContentView.swift
//  Iris-Demo
//
//  Created by Primpraow Mulling on 5/17/24.
//

import SwiftUI


struct ContentView: View {
    
    /* Side bar*/
    @State private var isSideBarOpened: Bool = false
    
    /* Types */
    struct Costume {
        var id: UUID
        var name: String
        var counting: Int
    }
    
    
    /* Color Schemes */
    let lightPurple = Color(red: 176/255, green: 166/255, blue: 203/255, opacity: 1.0)
    let purple = Color(red: 97/255, green: 77/255, blue: 150/255, opacity: 1.0)
    let pastelPurple = Color(red: 136/255, green: 121/255, blue: 176/255, opacity: 0.1)
    
    /* Items */
    let costumes = [
                    Costume(id: UUID(), name: "image 4", counting: 2),
                    Costume(id: UUID(), name: "image 5", counting: 3),
                    Costume(id: UUID(), name: "image 8", counting: 8),
                    Costume(id: UUID(), name: "image 10", counting: 5),
                    Costume(id: UUID(), name: "image 13", counting: 2)
                    ]
    
    var body: some View {

        ZStack {
            
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.red.opacity(0.6))
            .opacity(isSideBarOpened ? 1 : 0)
           VStack(spacing: 20) {
               
                /* navigation bar*/
                   //Dimmed background
                   
                   VStack {
//                           .toolbar {
//                               ToolbarItem (placement: .principal) {
                                   HStack() {
                                       /* hamburger toggle */
                                       Button (action: {
                                           isSideBarOpened.toggle()
                                           print(isSideBarOpened)
                                       }, label: {
                                           Image(systemName: "line.horizontal.3")
                                               .foregroundColor(purple)
                                               .imageScale(.large)
                                       })
                                       
                                       Spacer()
                                       /* home */
                                       Text("Home")
                                           .foregroundColor(purple)
                                       
                                       /* gear */
                                       Image(systemName: "gearshape")
                                           .foregroundColor(purple)
                                           .imageScale(.large)
                                           .foregroundStyle(.tint)
                                   }
                                   
//                               }
                                                           
//                           }
//                       
                       }
                   /* sidebar view  */
                   SideBar(isSidebarVisible: $isSideBarOpened)
                       
              
       
                   
              
               
                /* divider */
                Rectangle()
                    .fill(lightPurple)
                    .frame(width: .infinity, height: 0.4, alignment: .center)
                    .edgesIgnoringSafeArea(.all)
                    
            

                /* carousel */
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .center, spacing: 10) {
                            ForEach(costumes, id: \.id) { costume in
                            
                                VStack(alignment: .center, spacing: 5) {
                                    Spacer()
                                    Image(costume.name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 125, height: 110)
                                        .padding()
                                    Spacer()
                                    Text("\(costume.name)")
                                        .font(.subheadline)
                                        .foregroundColor(Color(.gray))
                                        .fontWeight(.medium)
                                    Spacer()
  
                                }
                                /*gray frame*/
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 0.5)
                                        
                                )
                                .padding(2)
                            }
                    }
                    
//                    .padding(.all)
                }
                
                /* divider */
                Rectangle()
                    .fill(lightPurple)
                    .frame(width: .infinity, height: 0.4, alignment: .center)
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, 2)
                
                /* Buttons container */
        HStack(spacing: 10) {
                    /* Notification Button*/
                    Button(action : {
                        print("notification")
                    }) {
                        HStack {
                            Image(systemName: "exclamationmark.circle.fill"
                            )
                            .foregroundColor(.red.opacity(0.8))
                            Text(" # Notifications")
                                .foregroundStyle(.black)
                                .font(.subheadline)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .background(pastelPurple)
                        
                        
                    }
                    
                /* Bookmark Button */
                    Button(action : {
                        print("notification")
                    }) {
                        HStack(alignment: .center) {
                            Image(systemName: "bookmark.fill"
                            )
                            .foregroundColor(.gray.opacity(0.5))
                          
                            Text("#")
                                .foregroundStyle(.gray)
                                .font(.subheadline)
                        }
                        .padding()
                        .frame(maxWidth: 100)
                        .frame(height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .background(Color.gray.opacity(0.1))
                        
                    }

                }
                
                /* End of buttons container */
                
                /* Details */
                ScrollView {
                    LazyVStack(){
                        ForEach(costumes, id: \.id) { costume in
                        
                            HStack(spacing: 5) {
                                Image(costume.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                Spacer()
                                /* counting < 5 show low supply */
                                LazyVStack(alignment: .leading){
                                    (costume.counting < 5 ?
                                         Text(Image(systemName: "exclamationmark.circle.fill" )) +
                                         Text("low supply")
                                     : Text(""))
                                             .foregroundColor(.red.opacity(0.8))
                                             .font(.subheadline)
                                    HStack {
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(.green)
                                            .frame(width: 50, height: 20)
                                        Text("Color, Name")
                                            .font(.headline)
                                    }
                                    Grid(alignment: .center) {
                                        GridRow {
                                            Text("25 34 18 22 45 40 13")
                                                .font(.subheadline)
                                        }
                                        GridRow {
                                            Text("S  M  L  XL  2X  3X  4X")
                                                .font(.subheadline)
                                                .foregroundColor(Color(.gray))
                                        }
                                    }
                                    .padding(5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray, lineWidth: 0.4)
                                    )
                                    
                                    Text(costume.name)
                                        .font(.subheadline)
                                        .foregroundColor(Color(.gray))
                                }
                              

                            }
                            /*gray frame details*/
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 0.5)
                                    
                            )
                            .padding(4)
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
           }
            
            .padding(.all)
                   
        }
            
        }
}
    

#Preview {
    ContentView()
}
