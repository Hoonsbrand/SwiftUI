//
//  ContentView.swift
//  Stack
//
//  Created by hoonsbrand on 2023/03/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 1. VStack
        VStack(alignment: .leading, spacing: 20) {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
            
            Rectangle()
                .fill(.green)
                .frame(width: 150, height: 150)
            
            Rectangle()
                .fill(.orange)
                .frame(width: 100, height: 100)
        }
        
        // 2. HStack
        HStack(spacing: 20) {
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill(.green)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill(.orange)
                .frame(width: 100, height: 100)
        }
        
        // 3. ZStack
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(.red)
                .frame(width: 150, height: 150)
            
            Rectangle()
                .fill(.green)
                .frame(width: 130, height: 130)
            
            Rectangle()
                .fill(.orange)
                .frame(width: 100, height: 100)
        }
        
        // 4. Stack 응용
        ZStack(alignment: .top) {
            Rectangle()
                .fill(.yellow)
                .frame(width: 350, height: 500)
            
            VStack(alignment: .leading, spacing: 30) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 150, height: 150)
                
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                
                HStack(alignment: .bottom, spacing: 10) {
                    Rectangle()
                        .fill(.purple)
                        .frame(width: 50, height: 50)
                    
                    Rectangle()
                        .fill(.pink)
                        .frame(width: 75, height: 75)
                    
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 25, height: 25)
                }
                .background(Color.white)
            }
            .padding()
            .background(Color.black)
        }
        
        // 5. ZStack vs Background
        VStack(spacing: 50) {
            // ZStack을 사용해서 Circle에 1을 표현 -> layer가 복잡할 때 ZStack을 사용하면 좋다.
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                
                Text("1")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            // Background를 사용해서 Circle에 1을 동일하게 표현 -> layer가 단순할 때 추천
            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 100, height: 100)
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


