//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 21/02/24.
//

import SwiftUI

struct Screen11: View {
    @State private var navigationLinkIsActive11: Bool = false
    
    var body: some View {
        NavigationStack{
                ZStack{
                    Images.screenBackgroungTexture //old map texture
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        
                        Text(Screen11Strings.Label1.localized())

                        
                        Images.planoCartesiano4
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                        
                        Text(Screen11Strings.Label2.localized())
                        Text(Screen11Strings.Label3.localized())

                                                
                        Button("Continue") {
                            navigationLinkIsActive11 = true
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
                    
                    NavigationLink("",destination: Screen12(),isActive: $navigationLinkIsActive11)
                    
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
    Screen11()
}
