//
//  ScreenPlayable1.swift
//  PirateVectory
//
//  Created by Pamella Alvarenga on 01/02/24.
//
import SpriteKit

class Level1: SKScene {
    
  //  @State private var navigationLinkIsActive6: Bool = false
    
    var cartesianPointsContainer = SKNode()
    var ImagesBox = SKSpriteNode()
    var cartesianPointsArray: [SKNode] = []
    var node = SKSpriteNode()
    var revealedCartesianPoints: Int = 0
    let interactibleMap = InteractibleMap()
    
    override func didMove(to view: SKView) {
        
        self.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let corDeFundo = UIColor(ColorsConstants.screenBackgroundColor)
        
        self.backgroundColor = corDeFundo
        
        addChild(interactibleMap)

        interactibleMap.zPosition = 0
        
        ImagesBox = createTheCartesianPointsBox()
        
        addChild(ImagesBox)
       
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            let location = touch.location(in: oceanTexture)
//   
//            for case let obstacle as MapObstacle in mapObstaclesArray {
//                if obstacle.contains(location) {
//                    if obstacle.isInteractible{
//                        obstacle.toggleVisibility()
//                        
//                        for case let cartesianPoint as CartesianPointImage in cartesianPointsArray {
//                            if obstacle.associatedCartesianPoint == cartesianPoint.imageName {
//                                cartesianPoint.toggleVisibility()
//                                revealedCartesianPoints += 1
//                                if revealedCartesianPoints == 8 {
//                                    navigateToNextScreen()
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//
//        }
//    }
    

    func createTheCartesianPointsBox() ->  SKSpriteNode {
        
        let boxWidth = 0.85 * screenWidth
        let boxHeight = screenHeight - (0.92 * boxWidth + 4 * verticalSpacing)
        
        let boxPosition = CGPoint(x: 0, y: -(verticalSpacing/2))
       
        let ImagesBox = SKSpriteNode(color: .clear, size: CGSize(width: boxWidth, height: boxHeight))
        ImagesBox.position = boxPosition
        ImagesBox.zPosition = 1
        
        let ImagePoint_9_6 = CartesianPointImage(imageName: "(9,6)",  anchorPoint: CGPoint(x: 0, y: 0.5), position: CGPoint(x: -boxWidth/2, y: boxHeight/2), imageNodeWidth: 50.0)

//        let ImagePoint_2_3 = CartesianPointImage(imageName: "(2,3)",  anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: 0, y: boxHeight/2), imageNodeWidth: 50.0)
//
//        let ImagePoint_7_3 = CartesianPointImage(imageName: "(7,3)",  anchorPoint: CGPoint(x: 1, y: 0.5), position: CGPoint(x: boxWidth/2, y: boxHeight/2), imageNodeWidth: 50.0)
//
//        let ImagePoint_5_7 = CartesianPointImage(imageName: "(5,7)",  anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: -4.5*boxWidth/20, y: 0), imageNodeWidth: 50.0)
//
//        let ImagePoint_8_10 = CartesianPointImage(imageName: "(8,10)",  anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: 4.5*boxWidth/20 , y: 0), imageNodeWidth: 50.0)
//
//        let ImagePoint_8_11 = CartesianPointImage(imageName: "(8,11)",  anchorPoint: CGPoint(x: 0, y: 0.5), position: CGPoint(x: -boxWidth/2, y: -boxHeight/2), imageNodeWidth: 50.0)
//        
//        let ImagePoint_9_10 = CartesianPointImage(imageName: "(9,10)",  anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: 0, y: -boxHeight/2), imageNodeWidth: 50.0)
//        
//        let ImagePoint_9_11 = CartesianPointImage(imageName: "(9,11)",  anchorPoint: CGPoint(x: 1, y: 0.5), position: CGPoint(x: boxWidth/2, y: -boxHeight/2), imageNodeWidth: 50.0)
//        
//        cartesianPointsArray = [ImagePoint_9_6, ImagePoint_2_3, ImagePoint_7_3, ImagePoint_5_7, ImagePoint_8_10, ImagePoint_8_11, ImagePoint_9_10, ImagePoint_9_11]
        
        cartesianPointsArray = [ImagePoint_9_6]
        
        for case let cartesianPoint in cartesianPointsArray {
            ImagesBox.addChild(cartesianPoint)
        }
                
        return ImagesBox
    }
    
        func navigateToNextScreen() {
            if let view = self.view {
                let nextScene = Level2(size: self.size)
                nextScene.scaleMode = self.scaleMode
                view.presentScene(nextScene, transition: SKTransition.fade(withDuration: 0.5))
            }
        }
    
}
    



