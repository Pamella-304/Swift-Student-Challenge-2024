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
                    
                    Spacer()
                    
                    Text(Screen4Strings.Label1.localized())
                    
                    Spacer(minLength: 16)

                    Images.battleShield
                        .scaledToFit()
                        .padding()

                    Spacer(minLength: 16)

                    Text(Screen4Strings.Label2.localized())
                    
                    Spacer(minLength: 16)
                    
                    Button("Continue") {
                        navigationLinkIsActive4 = true
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

            NavigationLink("",destination: Screen5(),isActive: $navigationLinkIsActive4)
                
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
