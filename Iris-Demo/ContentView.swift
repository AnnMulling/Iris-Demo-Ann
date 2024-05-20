//
//  ContentView.swift
//  Iris-Demo
//
//  Created by Primpraow Mulling on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    private let costumes = ["image 4",
                            "image 5",
                            "image 8",
                            "image 10",
                            "image 13"]
    
    var body: some View {
      
        VStack {
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
                LazyHStack(spacing: 0) {
                    ForEach(costumes, id: \.self) { costume in
                        
                        Image(costume)
                            
                            .resizable()
                            .scaledToFill()
                            .frame(height: 100)
                          
                            .background(Color(.white))
                            .padding(.horizontal, 20)
                        
                    }
                }
            }
           
       }
        .padding(.all)
               
           }
        
}

#Preview {
    ContentView()
}
