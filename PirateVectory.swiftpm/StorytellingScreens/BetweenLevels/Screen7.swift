import SwiftUI

struct Screen7: View {
    @State private var navigationLinkIsActive7: Bool = false
    
    var body: some View {
        NavigationStack{
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
                            .frame(width: UIScreen.main.bounds.width * 0.7, alignment: .center) // Ajuste conforme necessário
                            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.3)

                        
                        Spacer()
                        
                        Text(Screen7Strings.Label2.localized())
                            //.padding(.bottom, 16)

                        Spacer()
                                                
                        Button("Continue") {
                            navigationLinkIsActive7 = true
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


#Preview {
    Screen7()
}

