//
//  Screen2.swift
//  PirateVectory
//
//  Created by Pamella Alvarenga on 29/01/24.
//

import SwiftUI

struct Screen2: View {
    
    @State private var navigationLinkIsActive2: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Images.screenBackgroungTexture //old map texture
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Spacer()
                    
                    Text(Screen2Strings.Label1.localized())
                    
                    Spacer(minLength: 16)

                    Images.map
                        .scaledToFit()
                    
                    Spacer(minLength: 16)

                    Text(Screen2Strings.Label2.localized())
                    
                    Spacer(minLength: 16)
                    
                    Button("Continue") {
                        navigationLinkIsActive2 = true
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

            NavigationLink("",destination: Screen3(),isActive: $navigationLinkIsActive2)
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(ColorsConstants.screenBackgroundColor)
            .foregroundColor(ColorsConstants.screenForegroundColor)
            //.ignoresSafeArea()
            .multilineTextAlignment(.center)
            .font(FontManager.getFont(size: 45.0))
            .navigationBarBackButtonHidden(true)
        }
    }
    

}

#Preview {
    Screen2()
}

