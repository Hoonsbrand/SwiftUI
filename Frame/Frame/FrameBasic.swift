//
//  FrameBasic.swift
//  Frame
//
//  Created by hoonsbrand on 2023/03/29.
//

import SwiftUI

struct FrameBasic: View {
    var body: some View {
        // 1
        VStack(spacing: 20) {
            Text("Hello, SwiftUI!")
                .font(.title)
                .background(Color.green)
                .frame(width: 200, height: 200)
                .background(Color.red)
                
            Divider()
            // 2
                Text("Hello, SwiftUI!")
                .font(.title)
                .background(Color.green)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
        }
        
        // 3
        VStack(spacing: 20) {
            Text("Hello, SwiftUI!")
                .font(.title)
                .background(Color.red)
                .frame(height: 100, alignment: .top)
                .background(Color.orange)
                .frame(width: 200)
                .background(Color.purple)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.pink)
                .frame(height: 400)
                .background(Color.green)
                .frame(maxHeight: .infinity, alignment: .top)
                .background(Color.yellow)
        }
    }
}

struct FrameBasic_Previews: PreviewProvider {
    static var previews: some View {
        FrameBasic()
    }
}


