//
//  TextBasic.swift
//  SwiftUIBasic_Text
//
//  Created by hoonsbrand on 2023/03/29.
//

import SwiftUI

struct TextBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            // Font 사이즈를 title, body, footnote 등으로 정하면 responsive하게 변화함
            Text("Hello SwiftUI!")
                .font(.title)
                .fontWeight(.semibold)
                .bold() // == .fontWeight(.bold)
                .underline(true, color: .red) // 밑줄, bool 타입으로 설정 가능
                .italic() // 글자를 기울릴 수 있다.
                .strikethrough(true, color: .green) // 취소선, bool 타입으로 설정 가능
            
            
            // 이 방법으로 하게 되면 text 크기를 지정할 수 있다. ex) font 12, 40
            // 단점은 기기 사이즈에 상관없이 고정이 된다는 것이다. -> 이것을 고려해서 사용
            Text("Hello UIKit!".uppercased())
                .font(.system(size: 25, weight: .semibold, design: .serif))
            
            // multiLine text alignment
            Text("멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다.")
                .multilineTextAlignment(.leading)
                .foregroundColor(.red)
        }
        
    }
}

struct TextBasic_Previews: PreviewProvider {
    static var previews: some View {
        TextBasic()
    }
}


