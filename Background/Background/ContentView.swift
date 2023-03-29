//
//  ContentView.swift
//  Background
//
//  Created by hoonsbrand on 2023/03/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
           // 1.Background
            Text("Hello, SwiftUI!")
                .frame(width: 100, height: 100)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.red, .blue]),
                                startPoint: .leading,
                                endPoint: .trailing)
                        )
                )
                .frame(width: 120, height: 120)
                .background(
                    Circle()
                        .fill(.yellow)
                )
            
            Divider()
            
            // 2.Overlay
            Circle()
                .fill(.pink)
                .frame(width: 100, height: 100)
                .overlay(
                    Text("1")
                        .font(.title)
                        .foregroundColor(.white)
                )
                .background(
                    Circle()
                        .fill(.purple)
                        .frame(width: 120, height: 120)
                )
            
            Divider()
            
            
            // 3. Background and overlay
            Rectangle()
                .frame(width: 200, height: 200)
                .overlay(
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 100, height: 100)
                    , alignment: .leading
                )
                .background(
                    Rectangle()
                        .fill(.red)
                        .frame(width: 250, height: 250)
                )
                .padding()
            
            Divider()
            
            // 4
            Image(systemName: "heart.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.cyan, .blue]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                        )
                        .frame(width: 100, height: 100)
                        .shadow(color: .blue, radius: 10, x: 0, y: 10)
                        .overlay(
                            Circle()
                                .fill(.red)
                                .frame(width: 35, height: 35)
                                .overlay(
                                    Text("7")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                )
                                .shadow(color: .red, radius: 10, x: 5, y: 5)
                            , alignment: .bottomTrailing // 위치 변경
                        )
                )
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
