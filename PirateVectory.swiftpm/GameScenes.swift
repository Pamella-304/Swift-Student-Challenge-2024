
import SwiftUI
import SpriteKit

class GameController: ObservableObject {
    @Published var navigate: Bool = false
    @Published var image:UIImage?
}

struct GameScene1: View {
    
    @StateObject var controllerLevel1 = GameController()
    
    var sceneLevel1: SKScene {
            let sceneLevel1 = Level1()
            sceneLevel1.controller = controllerLevel1
            sceneLevel1.size = CGSize(width: 300, height: 400)
            sceneLevel1.scaleMode = .fill
            return sceneLevel1
    }
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            SpriteView(scene: sceneLevel1)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true) 
            
            let image = controllerLevel1.image
            
            NavigationLink("", destination: Screen6(image: $controllerLevel1.image), isActive: $controllerLevel1.navigate)
        }
            
        
    }
}

struct GameScene2: View {
    
    @StateObject var controllerLevel2 = GameController()
    
    var sceneLevel2: SKScene {
            let sceneLevel2 = Level2()
            sceneLevel2.controller = controllerLevel2
            sceneLevel2.size = CGSize(width: 300, height: 400)
            sceneLevel2.scaleMode = .fill
            return sceneLevel2
    }
    
    @Environment(\.dismiss) var dismiss //Ela será responsável por tirar essa view de exibição
    
    var body: some View {
        ZStack{
            SpriteView(scene: sceneLevel2)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            
            
            NavigationLink("", destination: ScreenPreFinal(), isActive: $controllerLevel2.navigate)
        }
            
        
    }
}

