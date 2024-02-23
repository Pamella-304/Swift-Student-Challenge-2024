import SwiftUI

struct Screen8: View {
    @State private var navigationLinkIsActive8: Bool = false
    
    @State private var index: Int = 0
    
    let listOfCartesianPlans: [Image] = [Images.planoCartesiano1, Images.planoCartesiano2, Images.planoCartesiano3, Images.planoCartesiano4, Images.planoCartesiano5, Images.planoCartesiano5]
    
    
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ZStack{
                    Images.screenBackgroungTexture //old map texture
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        
                        Text(Screen8Strings.Label1.localized())
                        
                        Spacer()
                        
                        listOfCartesianPlans[index]
                            .resizable()
                            .scaledToFit()
                            .frame(width: 0.9 * geometry.size.width, height: 0.9 * geometry.size.height, alignment: .center)
                            .position(x: geometry.size.width / 2 , y: geometry.size.width / 2 )
                        
                        
                        
                        Spacer()
                        
                        Text(Screen8Strings.Label2.localized())
                        
                        Spacer()
                        
                        Button("Continue") {
                                             
                            index = index + 1
                            
                            if index == 5 {
                                navigationLinkIsActive8 = true
                            }
                            

                        }
                        .frame(width: geometry.size.width * 0.53, height: geometry.size.height * 0.07)
                        .background(
                            ColorsConstants.buttonBackgroundColor
                                .cornerRadius(80)
                                .shadow(radius: 2)
                            
                        )
                        .foregroundColor(ColorsConstants.buttonForegroundColor)
                        .font(Fonts.buttonFont)
                        
                    }.frame(width: 0.9*geometry.size.width, height: 0.9*geometry.size.width, alignment: .center)
                        .padding(.top, 0.06*geometry.size.width)
                        .padding(.bottom, 0.04*geometry.size.height)
                    
                    NavigationLink("",destination: Screen9(),isActive: $navigationLinkIsActive8)
                    
                }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
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
