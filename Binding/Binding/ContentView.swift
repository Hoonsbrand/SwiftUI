//
//  ContentView.swift
//  Binding
//
//  Created by hoonsbrand on 2023/04/04.
//

/*
 SwiftUI에서 자신 View의 상태값을 저장하기 위해서는 State wrapper를 사용한다.
 하지만 이 상태값을 자신의 Subview(하위 뷰)에도 적용시킬 경우도 존재한다.
 이럴때 사용하는 것이 binding wrapper 이다.
 */

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var backgroundColor: Color = .green
    @State private var title: String = "Binding Basic View"
    
    var body: some View {
        ZStack {
            // background
            backgroundColor
                .ignoresSafeArea()
            
            // content
            VStack {
                Text(title)
                
                // button
                // parameter로 @State의 값에 $를 붙여준다.
                BindingChild(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


