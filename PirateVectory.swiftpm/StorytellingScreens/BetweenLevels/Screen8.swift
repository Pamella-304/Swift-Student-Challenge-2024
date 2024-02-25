import SwiftUI

struct Screen8: View {
    @State private var navigationLinkIsActive8: Bool = false
    
    @State private var index: Int = 0
    
    
    let listOfCartesianPlans: [Image] = [Images.planoCartesiano1,
                                         Images.planoCartesiano2,
                                         Images.planoCartesiano3,
                                         Images.planoCartesiano4,
                                         Images.planoCartesiano5,
                                         Images.planoCartesiano5]
                                      
    
    let listOfLabels1: [String] = [Screen8Strings.Label1.localized(),
                                   Screen9Strings.Label1.localized(),
                                   Screen10Strings.Label1.localized(),
                                   Screen11Strings.Label1.localized(),
                                   Screen12Strings.Label1.localized(),
                                   Screen12Strings.Label1.localized()]
                                   
    let listOfLabels2: [String] = [Screen8Strings.Label2.localized(),
                                   Screen9Strings.Label2.localized(),
                                   Screen10Strings.Label2.localized(),
                                   Screen11Strings.Label2.localized(),
                                   Screen12Strings.Label2.localized(),
                                   Screen12Strings.Label2.localized()]
                                
    var body: some View {
        NavigationStack{
            
            GeometryReader { geometry in
                ZStack{
                    Images.screenBackgroungTexture //old map texture
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        HStack{
                            Text(listOfLabels1[index])
                                .background(GeometryReader { geometry in
                                    Color.clear.onAppear {
                                   
                                    }
                                })
                        }.frame(height: 135,alignment: .center)
                        
                        Spacer()
                        
                        listOfCartesianPlans[index]
                            .resizable()
                            .scaledToFit()
                            .frame(width: 0.8 * geometry.size.width, alignment: .center)
                            .frame(width: geometry.size.width)
                        
                        
                      
                        Spacer()
                        HStack{
                            Text(listOfLabels2[index])
                        }.frame(height: 90,alignment: .center)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.02)
                        
                        Button(action:{
                            navigationLinkIsActive8 = true
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
}


#Preview {
    Screen8()
}
