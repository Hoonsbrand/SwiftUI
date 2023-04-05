//
//  ExtractSubViewBasic.swift
//  ExtractView
//
//  Created by hoonsbrand on 2023/04/04.
//

import SwiftUI

struct ExtractSubViewBasic: View {
    var body: some View {
        ZStack {
            // background
            Color.cyan
                .ignoresSafeArea()
            
            // content
            contentLayer
            
        }
    }
    
    var contentLayer: some View {
        HStack {
            ItemBasic(title: "사과", count: 1, color: .red)
            ItemBasic(title: "오렌지", count: 10, color: .orange)
            ItemBasic(title: "바나나", count: 34, color: .yellow)
        }
    }
}

struct ExtractSubViewBasic_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubViewBasic()
    }
}
