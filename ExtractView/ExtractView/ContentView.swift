//
//  ContentView.swift
//  ExtractView
//
//  Created by hoonsbrand on 2023/04/04.
//

// 코드의 양이 많아지고 복잡해지면 body에 있는 부분이 길어져서 코드를 읽기에 어려움이 생긴다.
// 그래서 body에 있는 내용을 한번에 묶어 밑으로 내리거나 파일을 만듬으로 컴포넌트화 해서 사용할 수 있다.
// 이렇게 한다면 장점은 코드 가독성이 높아지고 컴포넌트를 사용해서 나중에 코드 작성자가 아닌 다른 사람이 코드를 수정할 때 훨씬 이해가 빠르고 유지보수 측면에도 도움이 된다.

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State var backgroundColor: Color = .pink
    
    var body: some View {
        ZStack {
            // background
            backgroundColor
                .ignoresSafeArea()
            
            // content
            contentLayer
            
        } // ZStack
    }
    
    // Content
    var contentLayer: some View {
        VStack {
            Text("Extract View 연습")
                .font(.largeTitle)
            
            Button {
                // action도 함수로 따로 뺄 수 있다.
                buttonPressed()
            } label: {
                Text("바탕색 변경")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
        }
    }
    
    // Function
    func buttonPressed() {
        backgroundColor = .yellow
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
