//
//  File.swift
//
//
//  Created by Pamella Alvarenga on 30/01/24.
//

import Foundation
import SwiftUI

struct CustomButton: View {

    var title: String = "Continue"
    var action: () -> Void
    var font: Font = Fonts.buttonFont
    var backgroundColor: Color = ColorsConstants.buttonBackgroundColor
    var foregroundColor: Color = ColorsConstants.buttonForegroundColor
    var cornerRadius: CGFloat = 80
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(font)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(cornerRadius)
        }
    }
    
}
