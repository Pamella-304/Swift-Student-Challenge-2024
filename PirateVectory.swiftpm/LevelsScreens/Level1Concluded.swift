//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 21/02/24.
//

//import SpriteKit
//
//class Level1Concluded: SKScene {
//    
//  //  @State private var navigationLinkIsActive6: Bool = false
//    
//    var cartesianPointsContainer = SKNode()
//    var cartesianPointsArray: [SKNode] = []
//    var node = SKSpriteNode()
//    var revealedCartesianPoints: Int = 0
//    let interactibleMap = InteractibleMap()
//    
//    override func sceneDidLoad() {
//        interactibleMap.sceneDidLoad()
//    }
//    
//    override func didMove(to view: SKView) {
//        
//        self.size = myScreenSize
//        
//        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
//        
//        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        
//        let corDeFundo = UIColor(ColorsConstants.screenBackgroundColor)
//        
//        self.backgroundColor = corDeFundo
//        
//        print("ScreenHeight")
//        print(screenHeight)
//        
//        addChild(interactibleMap)
//
//        interactibleMap.zPosition = 1
//        
//        for obstacle in interactibleMap.mapObstaclesArray{
//            obstacle.alpha = 1
//        }
//        
//        let label = SKLabelNode(text: Level1ConcludedStrings.Label.localized())
//        label.fontSize = 45.0
//        label.fontName = "LuckiestGuy-Regular"
//        label.fontColor = SKColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
//        label.position = CGPoint(x: 0, y: -interactibleMap.frame.size.height/2 - label.frame.size.height/2 - 10)
//        label.preferredMaxLayoutWidth = interactibleMap.frame.size.width
//        label.numberOfLines = 0 
//        label.lineBreakMode = .byWordWrapping
//
//        addChild(label)
//       
//    }
//    
////    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
////        
////        
////        for touch in touches {
////            let location = touch.location(in: interactibleMap.oceanTexture)
////            
////
////            for case let obstacle as MapObstacle in interactibleMap.mapObstaclesArray {
////                
////                if obstacle.contains(location) {
////                    
////                   
////
////                    if obstacle.isInteractible{
////                        obstacle.toggleVisibility()
////                        
////                        for case let cartesianPoint as CartesianPointImage in cartesianPointsArray {
////                            if obstacle.associatedCartesianPoint == cartesianPoint.imageName {
////                                cartesianPoint.toggleVisibility()
////                                revealedCartesianPoints += 1
////                                if revealedCartesianPoints == 8 {
////                                    navigateToNextScreen()
////                                }
////                            }
////                        }
////                    }
////                }
////            }
////
////        }
////    }
//
//   
//    
//    
//        func navigateToNextScreen() {
//            if let view = self.view {
//                let nextScene = Level2(size: self.size)
//                nextScene.scaleMode = self.scaleMode
//                view.presentScene(nextScene, transition: SKTransition.fade(withDuration: 0.5))
//            }
//        }
//    
//}
//    
//
//
//
