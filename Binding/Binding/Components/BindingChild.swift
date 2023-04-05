//
//  BindingChild.swift
//  Binding
//
//  Created by hoonsbrand on 2023/04/04.
//

import SwiftUI

struct BindingChild: View {
    // MARK: - Properties
    @State var buttonColor: Color = .blue
    @Binding var backgroundColor: Color
    @Binding var title: String
    
    var body: some View {
        Button {
            // action
            backgroundColor = .orange
            buttonColor = .pink
            title = "Binding Child View"
        } label: {
            Text("Child View 이동")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        }

    }
}

struct BindingChild_Previews: PreviewProvider {
    static var previews: some View {
        BindingChild(backgroundColor: .constant(.orange), title: .constant("Binding Child"))
            .previewLayout(.sizeThatFits)
    }
}
