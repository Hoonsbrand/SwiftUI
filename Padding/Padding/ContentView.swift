//
//  ContentView.swift
//  Padding
//
//  Created by hoonsbrand on 2023/04/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 1. Padding 기본
            Text("Hello, SwiftUI!")
                .background(Color.yellow)
                .padding()  // 기본값 -> .padding(.all, 15)
                .padding(.leading, 20) // CSS 기준 padding
                .background(Color.blue)
                .padding(.bottom, 20) // CSS 기준 margin
            
            Divider()
            
            // 2. Padding 응용
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            
            Text("안녕하세요! SwiftUI에 오신 여러분 환영합니다. 안녕하세요! SwiftUI에 오신 여러분 환영합니다.안녕하세요! SwiftUI에 오신 여러분 환영합니다.안녕하세요! SwiftUI에 오신 여러분 환영합니다.")
        }
        // 3. VStack 범위 밖에서 padding 설정
        .padding()
        .padding(.vertical, 30)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(
                    color: .black.opacity(0.3),
                    radius: 10,
                    x: 10, y: 10)
        )
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
