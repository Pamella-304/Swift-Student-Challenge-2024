//
//  Screen4.swift
//  PirateVectory
//
//  Created by Pamella Alvarenga on 31/01/24.
//

import SwiftUI

struct Screen4: View {
    
    @State private var navigationLinkIsActive4: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Images.screenBackgroungTexture //old map texture
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                                        
                    Text(Screen4Strings.Label1.localized())
                    
                    Spacer()

                    Images.battleShield
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.6) // Ajuste conforme necessário

                    Spacer()

                    Text(Screen4Strings.Label2.localized())
                        .padding(.bottom, UIScreen.main.bounds.height * 0.02)
                        
                                        
                    Button(action:{
                        navigationLinkIsActive4 = true
                    }){
                        Text("Continue")
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.15)
                            .padding(.top, UIScreen.main.bounds.height * 0.02)
                            .padding(.bottom, UIScreen.main.bounds.height * 0.013)
                            .background(ColorsConstants.buttonBackgroundColor)
                            .cornerRadius(80)
                            .shadow(radius: 2)
                            .foregroundColor(ColorsConstants.buttonForegroundColor)
                            .font(Fonts.buttonFont)
                            .multilineTextAlignment(.center)
                    }

                    
                }.frame(width: 0.9*screenWidth, height: 0.9*screenHeight, alignment: .center)
                    .padding(.bottom, 0.04*UIScreen.main.bounds.height)
                    .padding(.top, 0.06*UIScreen.main.bounds.height)

            NavigationLink("",destination: Screen5(),isActive: $navigationLinkIsActive4).animation(nil)
                
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
    Screen4()
}
