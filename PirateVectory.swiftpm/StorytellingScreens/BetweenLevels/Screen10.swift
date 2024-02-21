//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 21/02/24.
//

import SwiftUI

struct Screen10: View {
    @State private var navigationLinkIsActive10: Bool = false
    
    var body: some View {
        NavigationStack{
                ZStack{
                    Images.screenBackgroungTexture //old map texture
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        
                        Text(Screen10Strings.Label1.localized())

                        
                        Images.planoCartesiano3
                            .resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.height * 0.55) // Ajuste conforme necessário
                        
                        
                            //.padding(.bottom, 16)

                        Text(Screen10Strings.Label2.localized())

                                                
                        Button("Continue") {
                            navigationLinkIsActive10 = true
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
                    
                    NavigationLink("",destination: Screen10(),isActive: $navigationLinkIsActive10)
                    
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
    Screen8()
}
