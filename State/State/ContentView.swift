//
//  ContentView.swift
//  State
//
//  Created by hoonsbrand on 2023/04/03.
//

import SwiftUI

struct ContentView: View {
    
    // property
    @State private var backgroundColor: Color = Color.green
    @State private var myTitle: String = "아직 버튼 안눌림"
    @State private var count: Int = 0
    
    var body: some View {
        ZStack {
            // background
            backgroundColor
                .ignoresSafeArea()
            
            // content
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                Text("카운트: \(count)")
                
                HStack(spacing: 20) {
                    Button {
                        // action
                        self.backgroundColor = .red
                        self.myTitle = "1번 버튼 눌림"
                        self.count += 1
                    } label: {
                        Text("1번 버튼")
                    }
                    
                    Button {
                        // action
                        backgroundColor = .purple
                        myTitle = "2번 버튼 눌림"
                        count -= 1
                    } label: {
                        Text("2번 버튼")
                    }


                }
            } // VStack
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


