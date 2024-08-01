import SwiftUI

struct Screen1: View {
    @State private var navigationLinkIsActive1: Bool = false
    
    var body: some View {
        NavigationStack{
                ZStack{
                    Images.screenBackgroungTexture //old map texture
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        
                        Text(Screen1Strings.Label1.localized())
                        
                        Spacer()
                        
                        Images.pirateVectory
                            .resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.height * 0.6) // Ajuste conforme necessário

                        Spacer()
                        
                        Text(Screen1Strings.Label2.localized())
                            .padding(.bottom, UIScreen.main.bounds.height * 0.02)
                         
                        Button(action:{
                            navigationLinkIsActive1 = true
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
                        .padding(.top, 0.06*UIScreen.main.bounds.height)
                        .padding(.bottom, 0.04*UIScreen.main.bounds.height)
                    
                    NavigationLink("",destination: Screen2(),isActive: $navigationLinkIsActive1)
                    
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
    Screen1()
}

