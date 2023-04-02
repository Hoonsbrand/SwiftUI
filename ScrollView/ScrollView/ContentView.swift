//
//  ContentView.swift
//  ScrollView
//
//  Created by hoonsbrand on 2023/04/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 1. 세로 스크롤
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(0..<50) { index in
                    Rectangle()
                        .fill(.blue)
                        .frame(height: 300)
                        .overlay(
                            Text("\(index) 번")
                                .font(.title)
                        )
                }
            }
        } // ScrollView
        
        // 2. 가로 스크롤
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(0..<50) { index in
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 300, height: 300)
                        .overlay(
                            Text("\(index) 번")
                                .font(.title)
                        )
                }
            }
        } // ScrollView
        
        // 3. 혼합
        // ScrollView의 기본값 -> Vertical, showsIndicators: true
        ScrollView() {
            // LazyStack -> 데이터 양이 많아질 때 화면에 보여지는 부분만 로딩이 되고 스크롤을 할 때 정보를 업데이트하는 방식
            LazyVStack {
                ForEach(0..<10) { _ in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(0..<20) { _ in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        } // LazyHStack
                    } // Horizontal ScrollView
                }
            } // LazyVStack
        } // Vertical ScrollView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



