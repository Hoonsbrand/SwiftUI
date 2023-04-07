//
//  ContentView.swift
//  Transition
//
//  Created by hoonsbrand on 2023/04/06.
//
/*
 Transition 효과도 Animation과 비슷하게 동적인 움직임을 추가시킨다.
 다른점은 어떤 object가 추가, 제거가 될 때 생기는 하나의 애니메이션으로 볼 수 있다.
 
 move: 단방향 이동 Transition
 opacity: 투명도 조절 Transition
 scale: 크기 조절 Transition
 asymmetric: 비대칭 방향 이동 Transition
 */

import SwiftUI

struct ContentView: View {
    
    // MARK: - properties
    @State var showTransition: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack(alignment: .bottom) {
                VStack {
                    Button {
                        withAnimation(.easeInOut) {
                            showTransition.toggle()
                        }
                    } label: {
                        Text("Buton")
                    }
                    
                    Spacer()
                } // VStack
                
                if showTransition {
                    RoundedRectangle(cornerRadius: 30)
                    //  .frame(height: UIScreen.main.bounds.height * 0.5) // UIScreen.main deprecated -> geometry 사용
                        .frame(height: geo.size.height * 0.5)
                        .opacity(showTransition ? 1.0 : 0.0)
                    
                    // 1번 move transition
//                        .transition(.move(edge: .bottom)) // edge로 나타나는 방향 설정 가능
                    
                    // 2번 opacity transition
                    // 0.0 ~ 1.0의 투명도를 서서히 보여주며 나타남, RoundedRectangle에서 opacity를 준것과 같음, 둘 중 하나만 있어도 됌
//                        .transition(.opacity)
                    
                    // 3번 scale transition
//                        .transition(.scale) // 크기가 점점 커지며 나타남
                    
                    // 4번 asymetric transition - 시작지점과 끝나는지점을 custom해서 정해주기 때문에 비대칭 transition
                        .transition(.asymmetric(
                            insertion: .move(edge: .leading),
                            removal: .move(edge: .trailing)))
                    
                }
            } // ZStack
            .frame(maxWidth: .infinity, maxHeight: .infinity) // geometry를 사용했더니 alignment가 변경되어 해당코드 추가
            .ignoresSafeArea(edges: .bottom)
        } // GeometryReader
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
