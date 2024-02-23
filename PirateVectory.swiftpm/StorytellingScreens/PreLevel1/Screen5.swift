//
//  Screen5.swift
//  PirateVectory
//
//  Created by Pamella Alvarenga on 31/01/24.
//

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
                                        
                    Text(Screen5Strings.Label1.localized())
                    
                    Spacer()
                    
                    Images.figure
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.65) // Ajuste conforme necessário
                        .padding(.bottom, UIScreen.main.bounds.height * 0.02)

                    Spacer()
                    
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
                    
                }.frame(width: 0.9*screenWidth, height: 0.9*screenHeight, alignment: .center)
                    .padding(.top, 0.06*UIScreen.main.bounds.height)
                    .padding(.bottom, 0.04*UIScreen.main.bounds.height)
                
                NavigationLink("",destination: GameScene1(),isActive: $navigationLinkIsActive5).animation(nil)
                
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
