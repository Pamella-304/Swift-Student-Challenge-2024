//
//  SwiftUIView.swift
//  PirateVectory
//
//  Created by Pamella Alvarenga on 30/01/24.
//

import SwiftUI

struct Screen3: View {
    
    @State private var navigationLinkIsActive3: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Images.screenBackgroungTexture //old map texture
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Text(Screen3Strings.Label1.localized())
                    
                    Spacer()

                    Images.graphic
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.7) //

                    Spacer()

                    Text(Screen3Strings.Label2.localized())
                        .padding(.bottom, UIScreen.main.bounds.height * 0.02)
                    
                 
                    
                    Button("Continue") {
                        navigationLinkIsActive3 = true
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

            NavigationLink("",destination: Screen4(),isActive: $navigationLinkIsActive3).animation(nil)
                
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
    Screen3()
}
