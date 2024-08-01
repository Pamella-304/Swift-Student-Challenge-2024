import SwiftUI

struct Screen7: View {
    @State private var navigationLinkIsActive7: Bool = false
    
    var body: some View {
        NavigationStack{
            
            GeometryReader { geometry in
                ZStack{
                    Images.screenBackgroungTexture //old map texture
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        
                        Text(Screen7Strings.Label1.localized())
                        
                        Spacer()
                        
                        Images.cenario
                            .resizable()
                            .scaledToFit()
                            .frame(width: 0.8 * geometry.size.width, alignment: .center)
                            .frame(width: geometry.size.width)
                        
                      
                        Spacer()
                        
                        Text(Screen7Strings.Label2.localized())
                            .padding(.bottom, UIScreen.main.bounds.height * 0.02)
                        
                        Button(action:{
                            navigationLinkIsActive7 = true
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
                        
                    }.frame(width: 0.9*screenWidth, height: 0.9*screenHeight, alignment: .top)
                  
                    NavigationLink("",destination: Screen8(),isActive: $navigationLinkIsActive7)
                    
                }.frame(width: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, height: .infinity)
                    .background(ColorsConstants.screenBackgroundColor)
                    .foregroundColor(ColorsConstants.screenForegroundColor)
                    .multilineTextAlignment(.center)
                    .font(Fonts.bodyFont)
                    .navigationBarBackButtonHidden(true)
                
            }
        }
    }
}

#Preview {
    Screen7()
}


