//
//  ContentView.swift
//  Animation
//
//  Created by hoonsbrand on 2023/04/06.
//

/*
Animation: 시작, 상태변화, 도착 3가지 단계로 어떠한 로직이 실행될 때 object의 동적인 움직임을 말함
시작: View의 최초 상태
상태변화: View가 최초상태에서 멈추는 진행과정 상태
도착: View가 도달하려는 목표 지점이고, 도착하면 멈추는 상태
 */

import SwiftUI

struct ContentView: View {
    // MARK: - properties
    @State private var isAnimated: Bool = false
    
    private let timing: Double = 5.0
    
    // MARK: - body
    var body: some View {
        
        // 1번 View
        VStack {
            Button {
                withAnimation(
                    .default
//                        .repeatCount(5)       // 반복 횟수 지정
//                        .repeatForever()      // 계속 반복
//                        .delay(1.0)           // 딜레이
                ) {
                    isAnimated.toggle()
                }
            } label: {
                Text("Button")
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50: 0)
                .fill(isAnimated ? .red : .green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300
                )
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0)) // 도형을 특정 각도로 돌릴 수 있음
                .offset(y: isAnimated ? 300 : 0)// View가 horizontal, vertical 방향으로 할당한 값만큼 이동
            
            Spacer()

        } // VStack
        
        // 2번 View - Speed에 따른 animation
        VStack {
            Button {
                isAnimated.toggle()
            } label: {
                Text("Button")
            }
            
            // linear animation: 처음부터 끝까지 속도가 일정
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(.linear(duration: timing), value: isAnimated)
            
            // easeIn animation: 처음에 느렸다가 끝에 빨라지는 효과
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(.easeIn(duration: timing), value: isAnimated)
            
            // easeOut animation: 처음엔 빨랐다가 끝에 느려지는 효과
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(.easeOut(duration: timing), value: isAnimated)
            
            // easeInOut animation: 처음과 끝에 느려지고, 중간부분이 빨라지는 효과
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)
                .animation(.easeInOut(duration: timing), value: isAnimated)

        } // VStack
        
        // 3번 View - Spring animation
        VStack {
            Button {
                // response: 단일 진동을 완료하는 데 걸리는 시간
                // damping: 얼마나 빠르게 스프링이 정지하는 속도제어, 만약 0일때 영원히 멈추지 않음 0 ~ 1.0
                // blendDuration: 다른 애니메이션 간의 전환 길이 제어
                withAnimation(.spring(
                    response: 0.5,
                    dampingFraction: 0.5,
                    blendDuration: 0)) {
                        isAnimated.toggle()
                    }
            } label: {
                Text("Button")
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimated ? 350 : 50, height: 100)

        } // VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
