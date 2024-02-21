//
//  ScreenPlayable1.swift
//  PirateVectory
//
//  Created by Pamella Alvarenga on 01/02/24.
//
import SwiftUI
import SpriteKit


class Level1: SKScene {
    
  //  weak var levelDelegate: LevelDelegate?
  //  @State private var navigationLinkIsActive6: Bool = false
    
    var cartesianPointsContainer = SKNode()
    var ImagesBox = SKSpriteNode()
    var cartesianPointsArray: [SKNode] = []
    var node = SKSpriteNode()
    var revealedCartesianPoints: Int = 0
    let interactibleMap = InteractibleMap()
    var backgroundTexture = SKSpriteNode(imageNamed: "BackgroundMapTexture")

    
    var controller: GameController?

    override func sceneDidLoad() {
        interactibleMap.sceneDidLoad()
    }
    
    override func didMove(to view: SKView) {
        
        self.size = myScreenSize
        
        addChild(backgroundTexture)
        backgroundTexture.size = CGSize(width: screenWidth, height: screenHeight)
        backgroundTexture.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundTexture.position = CGPoint(x: 0, y: 0)
        backgroundTexture.zPosition = 1
                
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let corDeFundo = UIColor(ColorsConstants.screenBackgroundColor)
        
        self.backgroundColor = corDeFundo
        
        
        addChild(interactibleMap)

        interactibleMap.zPosition = 1
        
        ImagesBox = createTheCartesianPointsBox()
        
        addChild(ImagesBox)
        
        
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for touch in touches {
            let location = touch.location(in: interactibleMap.oceanTexture)
            

            for case let obstacle as MapObstacle in interactibleMap.mapObstaclesArray {
                
                if obstacle.contains(location) {
                    
                   

                    if obstacle.isInteractible{
                        obstacle.toggleVisibility()
                        
                        for case let cartesianPoint as CartesianPointImage in cartesianPointsArray {
                            if obstacle.associatedCartesianPoint == cartesianPoint.imageName {
                                cartesianPoint.toggleVisibility()
                                revealedCartesianPoints += 1
                                if revealedCartesianPoints == 1 {
                                    navigateToNextScreen()
                                }
                            }
                        }
                    }
                }
            }

        }
    }

    func createTheCartesianPointsBox() ->  SKSpriteNode {
        
        let boxWidth = 0.85 * screenWidth
        let boxHeight = screenHeight - (0.92 * boxWidth + 4 * verticalSpacing)
        
        let boxPosition = CGPoint(x: 0, y: interactibleMap.position.y - (interactibleMap.size.height/4 + verticalSpacing))
        
        //let boxPosition = CGPoint(x: 0, y: interactibleMap.position.y - (interactibleMap.scene?.size.height ?? 0 / 4  + verticalSpacing))
               
        let ImagesBox = SKSpriteNode(color: .clear, size: CGSize(width: boxWidth, height: boxHeight))
        ImagesBox.position = boxPosition
        ImagesBox.zPosition = 10
        
        let imageNodeWidth = 0.18 * boxWidth
        
        let ImagePoint_9_6 = CartesianPointImage(imageName: "(9,6)",  anchorPoint: CGPoint(x: 0, y: 0.5), position: CGPoint(x: -boxWidth/2, y: boxHeight/2), imageNodeWidth: imageNodeWidth)

        let ImagePoint_2_3 = CartesianPointImage(imageName: "(2,3)",  anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: 0, y: boxHeight/2), imageNodeWidth: imageNodeWidth)

        let ImagePoint_7_3 = CartesianPointImage(imageName: "(7,3)",  anchorPoint: CGPoint(x: 1, y: 0.5), position: CGPoint(x: boxWidth/2, y: boxHeight/2), imageNodeWidth: imageNodeWidth)

        let ImagePoint_5_7 = CartesianPointImage(imageName: "(5,7)",  anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: -4.5*boxWidth/20, y: 0), imageNodeWidth: imageNodeWidth)

        let ImagePoint_8_10 = CartesianPointImage(imageName: "(8,10)",  anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: 4.5*boxWidth/20 , y: 0), imageNodeWidth: imageNodeWidth)

        let ImagePoint_8_11 = CartesianPointImage(imageName: "(8,11)",  anchorPoint: CGPoint(x: 0, y: 0.5), position: CGPoint(x: -boxWidth/2, y: -boxHeight/2), imageNodeWidth: imageNodeWidth)
        
        let ImagePoint_9_10 = CartesianPointImage(imageName: "(9,10)",  anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: 0, y: -boxHeight/2), imageNodeWidth: imageNodeWidth)
        
        let ImagePoint_9_11 = CartesianPointImage(imageName: "(9,11)",  anchorPoint: CGPoint(x: 1, y: 0.5), position: CGPoint(x: boxWidth/2, y: -boxHeight/2), imageNodeWidth: imageNodeWidth)
        
        cartesianPointsArray = [ImagePoint_9_6, ImagePoint_2_3, ImagePoint_7_3, ImagePoint_5_7, ImagePoint_8_10, ImagePoint_8_11, ImagePoint_9_10, ImagePoint_9_11]
        
        
        for case let cartesianPoint in cartesianPointsArray {
            ImagesBox.addChild(cartesianPoint)
        }
                
        return ImagesBox
    }
    
        func navigateToNextScreen() {
           // levelDelegate?.navigateToScreen6()
           // let snapshotView = scene?.view?.snapshotView(afterScreenUpdates: true)
          //let bounds = UIScreen.main.bounds
            
          //  UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
            
           // snapshotView?.drawHierarchy(in: bounds, afterScreenUpdates: true)
            
            if let mapImage = self.view?.texture(from: interactibleMap) {
               let image =  UIImage(cgImage: mapImage.cgImage())
                controller?.image = image
            }
            //let image = UIGraphicsGetImageFromCurrentImageContext()
            
           // UIGraphicsEndImageContext()
            
            controller?.navigate = true
            
//            if let view = self.view {
//                let nextScene = Level2(size: self.size)
//                nextScene.scaleMode = self.scaleMode
//                view.presentScene(nextScene, transition: SKTransition.fade(withDuration: 0.5))
//            }
        }
    
}
    



