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
                    
                    Text(ScreenFinalStrings.Label1.localized())
                    
                    Spacer()

                    Images.finalScreenImage                        
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                    
                    Spacer()

                    Text(ScreenFinalStrings.Label2.localized())
                    
                }.frame(width: 0.9*screenWidth, height: 0.9*screenHeight, alignment: .center)
                    .padding(.bottom, 0.04*UIScreen.main.bounds.height)
                    .padding(.top, 0.06*UIScreen.main.bounds.height)

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
