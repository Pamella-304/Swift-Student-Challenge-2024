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
        
        addResultantToScreen()
    
        
        for obstacle in interactibleMap.mapObstaclesArray{
            obstacle.alpha = 1
        }
        
        
        

    }
    
    func addResultantToScreen() {
        
        let vectorMagnetud = sqrt((7*interactibleMap.oceanTexture.size.width/11)*(7*interactibleMap.oceanTexture.size.width/11) + (10*interactibleMap.oceanTexture.size.height/12)*(10*interactibleMap.oceanTexture.size.height/12))
        
        let vectorPositionX = interactibleMap.oceanTexture.position.x - interactibleMap.oceanTexture.size.width/2
        let vectorPositionY = interactibleMap.oceanTexture.position.y - interactibleMap.oceanTexture.size.height/2
        
        redVector.zPosition = 5
        redVector.anchorPoint = CGPoint(x: 0, y: 0.5)
        redVector.size.width = vectorMagnetud
        redVector.position = CGPoint(x:vectorPositionX , y:vectorPositionY)
       
        redVector.zRotation = atan((10*interactibleMap.oceanTexture.size.height/12.0)/(7*interactibleMap.oceanTexture.size.width/11.0))

        interactibleMap.addChild(redVector)
        
    }
    
    func addVectorsToScreen(xValue: Double, yValue: Double) {
        
        let startPosition = CGPoint(x: redVector.position.x,y: redVector.position.y)
       
        let oppositeSide = yValue*interactibleMap.oceanTexture.size.height/12.0
        let adjacentSide = xValue*interactibleMap.oceanTexture.size.width/11.0
        
        let newVectorMagnetude = sqrt(oppositeSide*oppositeSide + adjacentSide*adjacentSide)
                
        let newVector = SKSpriteNode(imageNamed: "HorizontalAxe")
        
        newVector.zPosition = 5
        newVector.size.width = newVectorMagnetude
        newVector.anchorPoint = CGPoint(x: 0, y: 0.5)
        newVector.zRotation = atan((oppositeSide)/(adjacentSide))
        newVector.position = startPosition
        
        interactibleMap.addChild(newVector)
        
        
    }
    

}
