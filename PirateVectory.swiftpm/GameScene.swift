//
//  GameScene.swift
//  PirateVectory
//
//  Created by Pamella Alvarenga on 01/02/24.
//

import SwiftUI
import SpriteKit

class GameController: ObservableObject {
    @Published var navigate: Bool = false
    @Published var image:UIImage?
}

struct GameScene: View {
    
    @StateObject var controller = GameController()
    
    var scene: SKScene {
            let scene = Level1()
            scene.controller = controller
            scene.size = CGSize(width: 300, height: 400)
            scene.scaleMode = .fill
            return scene
    }
    
    @Environment(\.dismiss) var dismiss //Ela será responsável por tirar essa view de exibição
    
    var body: some View {
        ZStack{
            SpriteView(scene: scene)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true) 
           // Text(controller.navigate ?  "Sim" : "Ainda nao")
            
            let image = controller.image
            
            NavigationLink("", destination: Screen6(image: $controller.image), isActive: $controller.navigate)
        }
            
        
    }
}

struct GameSceneView_Previews: PreviewProvider {
    static var previews: some View {
        GameScene()
    }
}
