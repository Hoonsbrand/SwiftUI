//
//  ShapeBasic.swift
//  Shape
//
//  Created by hoonsbrand on 2023/03/29.
//

import SwiftUI

struct ShapeBasic: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            // Circle 원형
            Text("원형")
                .font(.title)
            Circle()
//                .fill(Color.blue)
//                .foregroundColor(.pink)
//                .stroke(Color.red, lineWidth: 20)
//                .stroke(Color.purple, style: StrokeStyle(lineWidth: 30, lineCap: .butt, dash: [30]))
                .trim(from: 0.2, to: 1.0)
                .stroke(Color.purple, lineWidth: 50)
                .frame(width: 200, height: 100, alignment: .center) // alignment는 center가 기본값
                .padding() // Text와 Circle간의 간격
            
            Spacer()
            
            // Ellipse 타원형
            Text("타원형")
                .font(.title)
            Ellipse()
                .fill(Color.green)
                .frame(width: 200, height: 100)
            
            Spacer()
            
            // Capsule 캡슐형
            Text("캡슐형")
                .font(.title)
            Capsule(style: .circular)
                .stroke(Color.blue, lineWidth: 30)
                .frame(width: 200, height: 100)
            
            Spacer()
        }
        
        VStack(spacing: 20) {
            
            Spacer()
            
            // Rectangle 직사각형
            Text("직사각형")
                .font(.title)
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 100)
            
            Spacer()
            
            // RoundedRectangle 둥근직사각형
            Text("둥근직사각형")
                .font(.title)
            RoundedRectangle(cornerRadius: 20)
                .trim(from: 0.4, to: 1.0)
                .frame(width: 300, height: 200, alignment: .center)
            
            Spacer()
        }
        
    }
}

struct ShapeBasic_Previews: PreviewProvider {
    static var previews: some View {
        ShapeBasic()
    }
}



