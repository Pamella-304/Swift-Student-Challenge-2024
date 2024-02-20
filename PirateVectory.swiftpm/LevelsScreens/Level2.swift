//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 08/02/24.
//

import SpriteKit

class Level2: SKScene {
    
    var redVector = SKSpriteNode(imageNamed: "RedVector")
    let interactibleMap = InteractibleMap()
    
    override func sceneDidLoad() {
        interactibleMap.sceneDidLoad()
    }
    
    override func didMove(to view: SKView) {
        
        self.size = myScreenSize
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let corDeFundo = UIColor(ColorsConstants.screenBackgroundColor)
        self.backgroundColor = corDeFundo
        
        addChild(interactibleMap)
        interactibleMap.zPosition = 1
        
        for obstacle in interactibleMap.mapObstaclesArray{
            obstacle.alpha = 1
        }
    }
    
}
