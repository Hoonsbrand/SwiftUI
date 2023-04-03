//
//  ContentView.swift
//  Button
//
//  Created by hoonsbrand on 2023/04/03.
//

import SwiftUI

struct ContentView: View {
    // property
    @State var mainTitle: String = "아직 버튼 안놀림"
    
    var body: some View {
        VStack(spacing: 20) {

            Group {
                // 리셋 버튼
                Button {
                    self.mainTitle = "아직 버튼 안놀림"
                } label: {
                    Text("리셋 버튼")
                }
                
                Divider()
                
                // 라벨
                Text(mainTitle)
                    .font(.title)
                
                Divider()
                
                // 1번 버튼
                // action -> button을 눌렀을 때 실행할 event
                // label -> button 모양 디자인
                Button {
                    // action
                    self.mainTitle = "기본 버튼 눌림"
                } label: {
                    // label
                    Text("기본 버튼")
                }
                .tint(.red)
                
                
                Divider()
                
                // 2번 버튼
                Button {
                    self.mainTitle = "저장 버튼 눌림"
                } label: {
                    Text("저장")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 20)
                        .background(
                            Color.blue
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        )
                }
                
                Divider()
            }
            
            // 3번 버튼
            Button {
                self.mainTitle = "하트 버튼 눌림"
            } label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    )
            }
            
            // Extra argument in call 에러 -> SwiftUI에서는 기본적으로 10개의 View만 넣을 수 있기 때문에 10개 이상을 원한다면 Grop { } 으로 묶어주어야한다.
            Divider()
            
            // 4번 버튼
            Button {
                self.mainTitle = "완료 버튼 눌림"
            } label: {
                Text("완료")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 2.5)
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


