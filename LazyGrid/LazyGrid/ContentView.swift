//
//  ContentView.swift
//  LazyGrid
//
//  Created by hoonsbrand on 2023/04/02.
//

import SwiftUI

struct ContentView: View {
    // LazyVGrid
    // columns(열)의 개수를 3개로 설정
    let colums: [GridItem] = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6)
    ]
    
    // LazyHGrid
    // title 1000개 변수 생성
    // ["목록 1", "목록 2", .... "목록 1000"] [String]
    let title: [String] = Array(1...1000).map { "목록 \($0)" }
    
    // 화면을 그리드형식으로 채워줌
    // row(행)의 개수를 2개로 설정
    let rows: [GridItem] = [
        GridItem(.flexible(maximum: 80)),
        GridItem(.flexible(maximum: 80))
    ]
    
    var body: some View {
        
        // 1. LazyVGrid
        ScrollView {
            // Hero 부분 (위에 사진 부분)
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            
            LazyVGrid(
                columns: colums,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders]) {
                    
                    // Section 1
                    Section {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(.gray)
                                .frame(height: 150)
                                .overlay(
                                    Text("\(index) 번")
                                )
                        }
                    } header: {
                        Text("Section 1")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.blue)
                            .padding()
                    } // Section 1
                    
                    // Section 2
                    Section {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(.green)
                                .frame(height: 150)
                                .overlay(
                                    Text("\(index) 번")
                                )
                        }
                    } header: {
                        Text("Section 2")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.red)
                            .padding()
                    } // Section 2
                }
        }
        
        // 2. LazyHGrid
        // Horizontal ScrollView
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(title, id: \.self) { item in
                    VStack {
                        Capsule()
                            .fill(.yellow)
                            .frame(height: 30)
                        
                        Text(item)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


