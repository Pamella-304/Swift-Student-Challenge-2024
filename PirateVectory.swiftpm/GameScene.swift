//
//  GameScene.swift
//  PirateVectory
//
//  Created by Pamella Alvarenga on 01/02/24.
//

import SwiftUI
import SpriteKit

struct GameScene: View {
    var scene: SKScene {
            let scene = Level1()
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
        }
    }
}

struct GameSceneView_Previews: PreviewProvider {
    static var previews: some View {
        GameScene()
    }
}
