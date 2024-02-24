import SwiftUI

struct Screen8: View {
    @State private var navigationLinkIsActive8: Bool = false
    
    @State private var index: Int = 0
    
    let listOfCartesianPlans: [Image] = [Images.planoCartesiano1, Images.planoCartesiano2, Images.planoCartesiano3, Images.planoCartesiano4, Images.planoCartesiano5, Images.planoCartesiano5, Images.grid]
    
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
                        
                        listOfCartesianPlans[0]
                            .resizable()
                            .scaledToFit()
                            .frame(width: 0.8 * geometry.size.width, alignment: .center)
                            .frame(width: geometry.size.width)
                        
                      
                        Spacer()
                        
                        Text(Screen7Strings.Label2.localized())
                            .padding(.bottom, UIScreen.main.bounds.height * 0.02)
                        
                        Button("Continue") {
                            navigationLinkIsActive8 = true
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
                  
                    NavigationLink("",destination: GameScene2(),isActive: $navigationLinkIsActive8)
                    
                }.frame(width: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, height: .infinity)
                    .background(ColorsConstants.screenBackgroundColor)
                    .foregroundColor(ColorsConstants.screenForegroundColor)
                    .multilineTextAlignment(.center)
                    .font(Fonts.bodyFont)
                    .navigationBarBackButtonHidden(true)
                
            }
        }
    }
    
//    var body: some View {
//        NavigationStack{
//                ZStack{
//                    Images.screenBackgroungTexture //old map texture
//                        .resizable()
//                        .scaledToFill()
//                        .edgesIgnoringSafeArea(.all)
//                    
//                    VStack{
//                        
//                        Text(Screen8Strings.Label1.localized())
//                            .frame(width: 0.9*screenWidth)
//                        
//                            listOfCartesianPlans[1]
//                                .resizable()
//                                .scaledToFit()
//                        
//                        //Spacer()
//                        
//                        Text(Screen8Strings.Label2.localized())
//                        
//                        //Spacer()
//                        
//                        Button("Continue") {
//                                             
//                            index = index + 1
//                            
//                            if index == 5 {
//                                navigationLinkIsActive8 = true
//                            }
//                            
//                        }
//                        .frame(width: screenWidth * 0.53, height: screenHeight * 0.07)
//                        .background(
//                            ColorsConstants.buttonBackgroundColor
//                                .cornerRadius(80)
//                                .shadow(radius: 2)
//                            
//                        )
//                        .foregroundColor(ColorsConstants.buttonForegroundColor)
//                        .font(Fonts.buttonFont)
//                        
//                    }
//                    .frame(width: 0.9*screenWidth, height: 0.9*screenHeight, alignment: .center)
//                        //.padding(.top, 0.06*UIScreen.main.bounds.height)
//                        //.padding(.bottom, 0.04*UIScreen.main.bounds.height)
//                    
//                    NavigationLink("",destination: GameScene2(),isActive: $navigationLinkIsActive8)
//                    
//                }.frame(width: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, height: .infinity, alignment: .center)
//                    .background(ColorsConstants.screenBackgroundColor)
//                    .foregroundColor(ColorsConstants.screenForegroundColor)
//                    .multilineTextAlignment(.center)
//                    .font(Fonts.bodyFont)
//                    .navigationBarBackButtonHidden(true)
//            }
//        }
    }

#Preview {
    Screen8()
}
