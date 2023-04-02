//
//  ContentView.swift
//  ForEach
//
//  Created by hoonsbrand on 2023/04/02.
//

import SwiftUI

struct ContentView: View {
    // 변수 생성
    var data: [String] = ["Hi", "Hello", "Hey everyone"]
    
    var body: some View {
        // 1. index
        VStack {
            // ForEach를 돌면서 index값이 하나씩 증가
            ForEach(0..<10) { index in
                HStack {
                    Circle()
                        .frame(width: 20, height: 20)
                    
                    Text("인덱스 번호: \(index)")
                } // HStack
            }
            
            Divider()
            
            // 2. 배열의 각 요소를 고유하게 식별
            // 각각 자신에게 id값을 자동으로 부여한다.
            ForEach(data, id: \.self) { item in
                Text(item)
            }
            
        } // VStack
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


