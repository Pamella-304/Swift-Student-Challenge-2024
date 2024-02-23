import SwiftUI
//import SpriteKit

struct Screen6: View{ //, LevelDelegate 
    @State private var navigationLinkIsActive6: Bool = false
    
    @Binding var image: UIImage?
    
    var interactibleMap = InteractibleMap()
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
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
                                .frame(width: geometry.size.width, alignment: .center)
                                //.position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.3)
                            
                        }
                        
                        Spacer()
                        
                        Text(Screen6Strings.Label.localized())
                            //.padding(.bottom, 16)
                        
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
                        
                    }.frame(width: geometry.size.width, height: 0.9*geometry.size.height, alignment: .center)
                    //.padding(.top, 0.06*UIScreen.main.bounds.height)
                        .padding(.bottom, 0.04*geometry.size.height)
                    
                    NavigationLink("",destination: Screen7(),isActive: $navigationLinkIsActive6)
                    
                }.frame(width: geometry.size.width, height: geometry.size.height)
                    .background(ColorsConstants.screenBackgroundColor)
                    .foregroundColor(ColorsConstants.screenForegroundColor)
                    .multilineTextAlignment(.center)
                    .font(Fonts.bodyFont)
                    .navigationBarBackButtonHidden(true)
            }
            }
        }
    
}
