//
//  ContentView.swift
//  IgnoreSafeArea
//
//  Created by hoonsbrand on 2023/04/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 1
        ZStack {
            // background
            Color.blue
                .ignoresSafeArea()
            
            // content
            VStack {
                Text("Hello, SwiftUI!")
                    .font(.largeTitle)
            }
        }
        
        // 2
        ScrollView {
            VStack {
                Text("박스형 리스트")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                
                ForEach(1..<11) { index in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding()
                        .overlay(
                            Text("\(index) 번 리스트")
                        )
                }
            }
        }
        .background(
            Color.blue
//                .ignoresSafeArea()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


