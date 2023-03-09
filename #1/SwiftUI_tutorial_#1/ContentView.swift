//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by hoonsbrand on 2023/03/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            MyVStackView()
            MyVStackView()
            MyVStackView()
        }   // HStack
        .padding(.all, 10)
        .background(Color.yellow)
    }
}

// 보여주는 용도
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
