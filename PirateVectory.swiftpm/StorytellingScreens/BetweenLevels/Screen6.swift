//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 21/02/24.
//

import SwiftUI
import SpriteKit

struct Screen6: View{ //, LevelDelegate 
    @State private var navigationLinkIsActive6: Bool = false
    
    @Binding var image: UIImage?
    
    var interactibleMap = InteractibleMap()
    
    var body: some View {
        NavigationStack{
                ZStack{
                    Images.screenBackgroungTexture
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        
                        if let image = image {
                                       Image(uiImage: image)
                                           .resizable()
                                           .scaledToFit()
                                           .frame(width: screenWidth, alignment: .center)
                                   }
                        
                        Spacer()
                        
                        Text(Screen6Strings.Label.localized())
                            .padding(.bottom, 16)

                        Spacer()
                                                
                        Button("Continue") {
                            navigationLinkIsActive6 = true
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.53, height: UIScreen.main.bounds.height * 0.07)
                        .background(
                            ColorsConstants.buttonBackgroundColor
                                .cornerRadius(80)
                                .shadow(radius: 2)

                        )
                        .foregroundColor(ColorsConstants.buttonForegroundColor)
                        //.font(Fonts.buttonFont)
                                                
                    }.frame(width: screenWidth, height: 0.9*screenHeight, alignment: .center)
                        //.padding(.top, 0.06*UIScreen.main.bounds.height)
                        .padding(.bottom, 0.04*UIScreen.main.bounds.height)
                    
                    NavigationLink("",destination: Screen7(),isActive: $navigationLinkIsActive6)
                    
                }.frame(width: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, height: .infinity)
                    .background(ColorsConstants.screenBackgroundColor)
                    .foregroundColor(ColorsConstants.screenForegroundColor)
                    .multilineTextAlignment(.center)
                    .font(Fonts.bodyFont)
                    .navigationBarBackButtonHidden(true)
            }
        }
    
}
