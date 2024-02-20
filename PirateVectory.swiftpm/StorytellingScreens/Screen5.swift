//
//  Screen5.swift
//  PirateVectory
//
//  Created by Pamella Alvarenga on 31/01/24.
//

import Foundation
import SwiftUI

struct Screen5: View {
    
    @State private var navigationLinkIsActive5: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Images.screenBackgroungTexture //old map texture
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Spacer(minLength: 16)
                    
                    Text(Screen5Strings.Label1.localized())
                    
                    Spacer(minLength: 16)

                    Images.figure
                        .scaledToFit()
                        .padding()
                    
                    Spacer(minLength: 16)

                    Button("Continue") {
                        navigationLinkIsActive5 = true
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.53, height: UIScreen.main.bounds.height * 0.07)
                    .background(
                        ColorsConstants.buttonBackgroundColor
                            .cornerRadius(80)
                            .shadow(radius: 2)
                    )
                    .foregroundColor(ColorsConstants.buttonForegroundColor)
                    .font(Fonts.buttonFont)
                    
                    Spacer(minLength: 16)
                    
                }.padding([.leading, .trailing], 40)
                  .padding([.top, .bottom], 40)
                
                NavigationLink("",destination: Screen6(),isActive: $navigationLinkIsActive5)
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(ColorsConstants.screenBackgroundColor)
            .foregroundColor(ColorsConstants.screenForegroundColor)
            .multilineTextAlignment(.center)
            .font(FontManager.getFont(size: 45.0))
            .navigationBarBackButtonHidden(true)
        }
    }
    

}

#Preview {
    Screen5()
}
