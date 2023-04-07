//
//  ContentView.swift
//  Sheet
//
//  Created by hoonsbrand on 2023/04/07.
//

/*
 sheet: 현재 View에서 약 90% 부분 정도 overlay 되는 View
 fullScreenCover: 현재 View에서 전체 부분 overlay 되는 View
 */
import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var isShownSheet: Bool = false
    @State private var isShownFullscreen: Bool = false
    
    var body: some View {
        ZStack {
            // MARK: - Background
            Color.green.ignoresSafeArea()
            
            // MARK: - Content
            VStack(spacing: 20) {
                
                // sheet 버튼
                Button {
                    isShownSheet.toggle()
                } label: {
                    Text("Sheet Button")
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isShownSheet) {
                    SheetBasic()
                }
                
                // fullscreen 버튼
                Button {
                    isShownFullscreen.toggle()
                } label: {
                    Text("FullScreen Button")
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $isShownFullscreen) {
                    SheetBasic()
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


