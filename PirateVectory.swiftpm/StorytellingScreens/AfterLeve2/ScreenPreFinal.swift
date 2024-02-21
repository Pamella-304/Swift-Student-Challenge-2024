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
                    
                    Spacer()

                    Images.treasure
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.85)

                    Spacer()

                    Text(ScreenPreFinalStrings.Label2.localized())
                        .padding(.bottom, UIScreen.main.bounds.height * 0.02)

                    
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
                    .padding(.top, 0.06*UIScreen.main.bounds.height)
                    .padding(.bottom, 0.04*UIScreen.main.bounds.height)

            NavigationLink("",destination: ScreenFinal(),isActive: $navigationLinkIsActivePreFinal)
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(ColorsConstants.screenBackgroundColor)
            .foregroundColor(ColorsConstants.screenForegroundColor)
            .multilineTextAlignment(.center)
            .font(Fonts.bodyFont)
            .navigationBarBackButtonHidden(true)
        }
    }
    

}

#Preview {
    Screen10()
}
