//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 16/02/24.
//


import SwiftUI

struct ScreenFinal: View {
    @State private var navigationLinkIsActiveFinal: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Images.screenBackgroungTexture //old map texture
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Spacer()
                    
                    Text(ScreenFinalStrings.Label1.localized())
                    
                    Spacer(minLength: 16)

                    Images.finalScreenImage                        
                        .scaledToFit()
                    
                    
                    Spacer(minLength: 16)

                    Text(ScreenFinalStrings.Label2.localized())
                    
                    Spacer(minLength: 16)
                    
                    
                }.padding([.leading, .trailing], 40)
                  .padding([.top, .bottom], 40)

            NavigationLink("",destination: Screen1(),isActive: $navigationLinkIsActiveFinal)
                
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
    ScreenFinal()
}
