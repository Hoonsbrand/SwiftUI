//
//  InitEnumBasic.swift
//  Init_Enum
//
//  Created by hoonsbrand on 2023/04/02.
//

import SwiftUI

struct InitEnumBasic: View {
    
    // 변수 선언
    let backgroundColor: Color
    let count: Int
    let title: String
    
    // enum 생성
    enum Fruit {
        case apple
        case orange
    }
    
    // init 함수 생성 -> View가 호출 될 때 실행되는 로직
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        switch fruit {
        case .apple:
            self.title = "사과"
            self.backgroundColor = .red
        case .orange:
            self.title = "오렌지"
            self.backgroundColor = .orange
        }
    }
    
    
    var body: some View {
        VStack (spacing: 20) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct InitEnumBasic_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            InitEnumBasic(count: 100, fruit: .apple)
            InitEnumBasic(count: 46, fruit: .orange)
        }
    }
}
