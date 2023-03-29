//
//  IconBasic.swift
//  Icon
//
//  Created by hoonsbrand on 2023/03/29.
//

import SwiftUI

struct IconBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.fill.badge.plus")
                .resizable() // 크기를 화면사이즈내 최대로 키운다.
            
            // renderingMode에서 original로 하게되면 실제 color에서 multi color로 변경된다.
            // 즉, 고유 값 color로 변경되어서 color를 변경하더라도 변경되지 않는 color 값이 된다.
                .renderingMode(.original)
                .scaledToFill()
                .foregroundColor(.red)
                .frame(width: 300, height: 300)
        }
    }
}

struct IconBasic_Previews: PreviewProvider {
    static var previews: some View {
        IconBasic()
    }
}


