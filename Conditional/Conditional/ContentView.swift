//
//  ContentView.swift
//  Conditional
//
//  Created by hoonsbrand on 2023/04/06.
//

import SwiftUI

struct ContentView: View {
    // property
    @State private var showCircle: Bool = false
    @State private var showRectangle: Bool = false
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // 로딩 버튼
            Button {
                isLoading.toggle()
            } label: {
                Text("로드중...: \(isLoading.description)")
            }
            
            // 로딩 이미지
            if isLoading { ProgressView() }
            
            Button {
                showCircle.toggle()
            } label: {
                Text("원형 버튼: \(showCircle.description)")
            }
            
            // 사각형 버튼
            Button {
                showRectangle.toggle()
            } label: {
                Text("사각형 버튼: \(showRectangle.description)")
            }
            
            // 조건 1: 원형 버튼이 true 일 때
            if showCircle { Circle().frame(width: 100, height: 100) }
            
            
            // 조건 2: 사각형 버튼 true 일 때
            if showRectangle { Rectangle().frame(width: 100, height: 100) }
            
            // 조건 3: 원형 버튼이 false 그리고 사각형 버튼이 false 일 때
            if !showCircle && !showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 200, height: 100)
            }
            
            // 조건 4: 원형 버튼 true 또는 사각형 버튼 true 일 때
            if showCircle || showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.red)
                    .frame(width: 200, height: 100)
            }
            
            Spacer()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



