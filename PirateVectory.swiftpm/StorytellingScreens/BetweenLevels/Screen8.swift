import SwiftUI

struct Screen8: View {
    @State private var navigationLinkIsActive8: Bool = false
    
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
                        
                        Images.planoCartesiano1
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width, alignment: .center)
                            .position(x: geometry.size.width , y: geometry.size.height )
                        
                        
                        Spacer()
                        
                        Text(Screen8Strings.Label2.localized())
                        //.padding(.bottom, 16)
                        
                        Spacer()
                        
                        Button("Continue") {
                            navigationLinkIsActive8 = true
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
