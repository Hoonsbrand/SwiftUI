//
//  ContentView.swift
//  TernaryOperators
//
//  Created by hoonsbrand on 2023/04/06.
//

import SwiftUI

struct ContentView: View {
    // property
    @State private var isStartingState: Bool = false
    
    var body: some View {
        VStack {
            // 1. if else 조건문
            Button {
                isStartingState.toggle()
            } label: {
                Text("if else 버튼: \(isStartingState.description)")
            }
            
            if isStartingState {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.red)
                    .frame(width: 200, height: 100)
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.blue)
                    .frame(width: 200, height: 100)
            }
            
            // 2. 삼항 연산자
            Button {
                isStartingState.toggle()
            } label: {
                Text("삼항연산자 버튼 : \(isStartingState.description)")
            }

            Text(isStartingState ? "빨강" : "파랑")
            
            RoundedRectangle(cornerRadius: isStartingState ? 25 : 0)
                .fill(isStartingState ? .red : .blue)
                .frame(
                    width: isStartingState ? 200 : 50,
                    height: isStartingState ? 400 : 100
                )
            
            Spacer()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
