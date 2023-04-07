//
//  SheetBasic.swift
//  Sheet
//
//  Created by hoonsbrand on 2023/04/07.
//

import SwiftUI

struct SheetBasic: View {
    
    // MARK: - properties
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            // background
            Color.red.ignoresSafeArea()
            
            // contents
            Button {
                // Sheet 닫기 action
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
            }

        }
    }
}

struct SheetBasic_Previews: PreviewProvider {
    static var previews: some View {
        SheetBasic()
    }
}


