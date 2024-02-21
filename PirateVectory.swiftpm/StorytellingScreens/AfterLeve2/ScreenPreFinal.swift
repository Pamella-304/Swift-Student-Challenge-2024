//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 20/02/24.
//

import SwiftUI

struct ScreenPreFinal: View {
    
    @State private var navigationLinkIsActivePreFinal: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Images.screenBackgroungTexture //old map texture
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                                        
                    Text(ScreenPreFinalStrings.Label1.localized())
                    
                    Spacer(minLength: 16)

                    Images.treasure
                        .scaledToFit()
                        .padding()

                    Spacer(minLength: 16)

                    Text(ScreenPreFinalStrings.Label2.localized())
                    
                    Spacer(minLength: 16)
                    
                    Button("Continue") {
                        navigationLinkIsActivePreFinal = true
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
                    .padding(.top, 60)
                    .padding(.bottom, 40)

            NavigationLink("",destination: ScreenFinal(),isActive: $navigationLinkIsActivePreFinal)
                
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
    Screen10()
}
