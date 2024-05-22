//
//  ContentView.swift
//  Iris-Demo
//
//  Created by Primpraow Mulling on 5/17/24.
//

import SwiftUI


struct ContentView: View {
    
    /* Types */
    struct Costume {
        var id: UUID
        var name: String
        var quality: Int
    }
    
   @State var lowSupply: Bool = false
    
    /* Color Schemes */
    let lightPurple = Color(red: 176/255, green: 166/255, blue: 203/255, opacity: 1.0)
    let purple = Color(red: 97/255, green: 77/255, blue: 150/255, opacity: 1.0)
    let pastelPurple = Color(red: 136/255, green: 121/255, blue: 176/255, opacity: 0.1)
    
    /* Items */
    let costumes = [
                    Costume(id: UUID(), name: "image 4", quality: 2),
                    Costume(id: UUID(), name: "image 5", quality: 3),
                    Costume(id: UUID(), name: "image 8", quality: 8),
                    Costume(id: UUID(), name: "image 10", quality: 5),
                    Costume(id: UUID(), name: "image 13", quality: 2)
                    ]
    
    var body: some View {
        
        ScrollView(.vertical){
         
            LazyVStack(spacing: 20) {
                /* navigation bar*/
               
                HStack(alignment: .center) {
                   Image(systemName: "line.horizontal.3")
                       .foregroundColor(purple)
                       .imageScale(.large)
                   Text("Home")
                       .foregroundColor(purple)
                   Spacer()
                   Image(systemName: "gearshape")
                       .foregroundColor(purple)
                       .imageScale(.large)
                       .foregroundStyle(.tint)
                }
        
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
//                                        .background(Color(.white))
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
                    
                    .padding(5)
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
                                /* quality < 5 show low quality */
                                LazyVStack(alignment: .leading){
                                    (costume.quality < 5 ?
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
                                            Text("25  34  18  22  45  40  13")
                                                .font(.subheadline)
                                        }
                                        GridRow {
                                            Text("S  M  L  XL  2X  3X  4X")
                                                .font(.subheadline)
                                                .foregroundColor(Color(.gray))
                                        }
                                    }
                                    .padding(4)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray, lineWidth: 0.4)
                                    )
                                    
                                    Text(costume.name)
                                        .font(.subheadline)
                                        .foregroundColor(Color(.gray))
                                }
                              
                                    

                            }
                            /*gray frame*/
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
