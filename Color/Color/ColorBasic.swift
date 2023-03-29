//
//  ColorBasic.swift
//  Color
//
//  Created by hoonsbrand on 2023/03/29.
//

import SwiftUI

struct ColorBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            
            // Basic Color
            Text("Basic Color")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.purple)
                .frame(width: 300, height: 100)
            
            // Primary Color
            // 자동으로 다크모드 색 지원
            Text("Primary Color")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.primary)
                .frame(width: 300, height: 100)
            
            // UIColor
            // UIKit에서 사용되는 Color 값을 사용할 수 있다.
            Text("UI Color")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(UIColor.secondarySystemBackground))
                .frame(width: 300, height: 100)
            
            // Custom Color
            Text("Custom Color")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("CustomColor"))
                .frame(width: 300, height: 100)
            
        }
    }
}

struct ColorBasic_Previews: PreviewProvider {
    static var previews: some View {
        ColorBasic()
            .preferredColorScheme(.dark)
    }
}


