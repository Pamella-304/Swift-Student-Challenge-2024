//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 21/02/24.
//

import SwiftUI

struct Screen12: View {
    @State private var navigationLinkIsActive12: Bool = false
    
    var body: some View {
        NavigationStack{
                ZStack{
                    Images.screenBackgroungTexture //old map texture
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        
                        Text(Screen12Strings.Label1.localized())

                        
                        Images.planoCartesiano5
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                        

                                                
                        Button("Continue") {
                            navigationLinkIsActive12 = true
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
                    
                    NavigationLink("",destination: GameScene2(),isActive: $navigationLinkIsActive12)
                    
                }.frame(width: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, height: .infinity)
                    .background(ColorsConstants.screenBackgroundColor)
                    .foregroundColor(ColorsConstants.screenForegroundColor)
                    .multilineTextAlignment(.center)
                    .font(Fonts.bodyFont)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }


#Preview {
    Screen12()
}
