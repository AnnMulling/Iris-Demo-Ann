//
//  ContentView.swift
//  Iris-Demo
//
//  Created by Primpraow Mulling on 5/17/24.
//

import SwiftUI


struct ContentView: View {
    
    struct Costume {
        var id: UUID
        var name: String
    }
    
    let costumes = [
                    Costume(id: UUID(), name: "image 4"),
                    Costume(id: UUID(), name: "image 5"),
                    Costume(id: UUID(), name: "image 8"),
                    Costume(id: UUID(), name: "image 10"),
                    Costume(id: UUID(), name: "image 13")
                    ]
    
    var body: some View {
        
        ScrollView(.vertical){
         
            LazyVStack {
                /* navigation bar*/
                HStack(alignment: .center) {
                   Image(systemName: "line.horizontal.3")
                       .foregroundColor(.purple)
                       .imageScale(.large)
                   Text("Home")
                       .foregroundColor(.purple)
                   Spacer()
                   Image(systemName: "gearshape")
                       .foregroundColor(.purple)
                       .imageScale(.large)
                       .foregroundStyle(.tint)
                   
                }
                
                /* carousel */
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 10) {
                            ForEach(costumes, id: \.id) { costume in
                            
                                VStack(alignment: .center, spacing: 10) {
                                    Spacer()
                                    Image(costume.name)
                                        .resizable()
                                        .scaledToFill()
//                                        .background(Color(.white))
                                        .frame(width: 125, height: 120)
                                        .padding()
                                    Spacer()
                                    Text("\(costume.name)")
                                        .font(.subheadline)
                                        .foregroundColor(Color(.gray))
                                        .fontWeight(.medium)
  
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
                
                LazyHStack(spacing: 10) {
                    /* Notification Button*/
                    Button(action : {
                        print("notification")
                    }) {
                        HStack {
                            Image(systemName: "exclamationmark.circle.fill"
                            )
                            .foregroundColor(.red.opacity(0.8))
                            Text("Notification")
                                .foregroundStyle(.black)
                                .font(.subheadline)
                        }
                        .padding()
                        .frame(width: .infinity, height: 44)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .background(Color.gray.opacity(0.1))
                        
                    }
                    
                /* Star Button */
                    Button(action : {
                        print("notification")
                    }) {
                        HStack {
                            Image(systemName: "bookmark.fill"
                            )
                            .foregroundColor(.gray.opacity(0.5))
                            Spacer()
                            Text("8")
                                .foregroundStyle(.gray)
                                .font(.subheadline)
                        }
                        .padding()
                        .frame(width: .infinity, height: 44)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .background(Color.gray.opacity(0.1))
                        
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
