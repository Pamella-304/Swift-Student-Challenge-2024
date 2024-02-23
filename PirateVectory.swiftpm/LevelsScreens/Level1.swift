
import SwiftUI
import SpriteKit


class Level1: SKScene {
    
    var cartesianPointsContainer = SKNode()
    var cartesianPointsBox = SKSpriteNode()
    var cartesianPointsArray: [SKNode] = []
    var node = SKSpriteNode()
    var revealedCartesianPoints: Int = 0
    let interactibleMap = InteractibleMap()
    var backgroundTexture = SKSpriteNode(imageNamed: Level1Strings.backgroundTexture.rawValue)
    var tutorialLabels: [SKSpriteNode] = []
    
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
        
        cartesianPointsBox = createTheCartesianPointsBox()
        addChild(cartesianPointsBox)
        
        tutorialLabels = createTheTutorialLabels()
        addChild(tutorialLabels[0])
        addChild(tutorialLabels[1])
        addChild(tutorialLabels[2])
        tutorialLabels[2].isHidden = true


    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        for touch in touches {
            
            var location = touch.location(in: self)
            print(location)
            
            if interactibleMap.oceanTexture.contains(location) {
                
                location = touch.location(in: interactibleMap.oceanTexture)
                
                for case let obstacle as MapObstacle in interactibleMap.mapObstaclesArray {
                    
                    if obstacle.contains(location) {
                        print("Obstacle contains touch location!")
//                        
                        if !tutorialLabels[2].isHidden {
                            tutorialLabels[2].isHidden = true
                        }
                        
                        if obstacle.isInteractible{
                            obstacle.toggleVisibility()
                            
                            for case let cartesianPoint as CartesianPointImage in cartesianPointsArray {
                                if obstacle.associatedCartesianPoint == cartesianPoint.imageName {
                                    cartesianPoint.toggleVisibility()
                                    revealedCartesianPoints += 1
                                    interactibleMap.redCircle.alpha = 0.0
                                    if revealedCartesianPoints == 8 {
                                        navigateToNextScreen()
                                    }
                                }
                            }
                        }
                    } else if !obstacle.contains(location) && revealedCartesianPoints == 0 {
                        interactibleMap.redCircle.alpha = 1.0
                    }
                }
                
                if revealedCartesianPoints == 1 {
                    cartesianPointsBox.isHidden = false
                    tutorialLabels[0].isHidden = true
                    tutorialLabels[1].isHidden = true
                    tutorialLabels[2].isHidden = false
                }
                
            } else if !interactibleMap.oceanTexture.contains(location) && revealedCartesianPoints == 0 {
                interactibleMap.redCircle.alpha = 1.0
            }
        }
    }
    

    func createTheCartesianPointsBox() ->  SKSpriteNode {
        
        let boxWidth = 0.85 * screenWidth
        let boxHeight = screenHeight - (0.92 * boxWidth + 4 * verticalSpacing)
        
        let boxPosition = CGPoint(x: 0, y: interactibleMap.position.y - (interactibleMap.size.height/4 + verticalSpacing))
        
        //let boxPosition = CGPoint(x: 0, y: interactibleMap.position.y - (interactibleMap.scene?.size.height ?? 0 / 4  + verticalSpacing))
               
        let cartesianPointsBox = SKSpriteNode(color: .clear, size: CGSize(width: boxWidth, height: boxHeight))
        cartesianPointsBox.position = boxPosition
        cartesianPointsBox.zPosition = 3
        
        let imageNodeWidth = 0.18 * boxWidth
        
        let ImagePoint_Rock = CartesianPointImage(imageName: Level1Strings.RockCartesianPoint.rawValue,
                                                  anchorPoint: CGPoint(x: 0, y: 0.5),
                                                  position: CGPoint(x: -boxWidth/2, y: boxHeight/2),
                                                  imageNodeWidth: imageNodeWidth)

        let ImagePoint_SmallIsland = CartesianPointImage(imageName: Level1Strings.SmallIslandCartesianPoint.rawValue,
                                                         anchorPoint: CGPoint(x: 0.5, y: 0.5),
                                                         position: CGPoint(x: 0, y: boxHeight/2),
                                                         imageNodeWidth: imageNodeWidth)

        let ImagePoint_MediumIsland = CartesianPointImage(imageName: Level1Strings.MediumIslandCartesianPoint.rawValue,
                                                          anchorPoint: CGPoint(x: 1, y: 0.5),
                                                          position: CGPoint(x: boxWidth/2, y: boxHeight/2),
                                                          imageNodeWidth: imageNodeWidth)

        let ImagePoint_GreenShip = CartesianPointImage(imageName: Level1Strings.GreenShipCartesianPoint.rawValue,
                                                       anchorPoint: CGPoint(x: 0.5, y: 0.5),
                                                       position: CGPoint(x: -4.5*boxWidth/20, y: 0),
                                                       imageNodeWidth: imageNodeWidth)

        let ImagePoint_BigIslandLowerLeft = CartesianPointImage(imageName: Level1Strings.BigIslandLowerLeftCartesianPoint.rawValue,
                                                  anchorPoint: CGPoint(x: 0.5, y: 0.5),
                                                  position: CGPoint(x: 4.5*boxWidth/20 , y: 0),
                                                  imageNodeWidth: imageNodeWidth)

        let ImagePoint_BigIslandUpperLeft = CartesianPointImage(imageName: Level1Strings.BigIslandUpperLeftCartesianPoint.rawValue,
                                                  anchorPoint: CGPoint(x: 0, y: 0.5),
                                                  position: CGPoint(x: -boxWidth/2, y: -boxHeight/2),
                                                  imageNodeWidth: imageNodeWidth)
        
        let ImagePoint_BigIslandLowerRight = CartesianPointImage(imageName: Level1Strings.BigIslandLowerRightCartesianPoint.rawValue,
                                                  anchorPoint: CGPoint(x: 0.5, y: 0.5),
                                                  position: CGPoint(x: 0, y: -boxHeight/2),
                                                  imageNodeWidth: imageNodeWidth)
        
        let ImagePoint_BigIslandUpperRight = CartesianPointImage(imageName: Level1Strings.BigIslandUpperRightCartesianPoint.rawValue,
                                                  anchorPoint: CGPoint(x: 1, y: 0.5),
                                                  position: CGPoint(x: boxWidth/2, y: -boxHeight/2),
                                                  imageNodeWidth: imageNodeWidth)
        
        cartesianPointsArray = [ImagePoint_Rock, ImagePoint_SmallIsland, ImagePoint_MediumIsland, ImagePoint_GreenShip, ImagePoint_BigIslandLowerLeft, ImagePoint_BigIslandUpperLeft, ImagePoint_BigIslandLowerRight, ImagePoint_BigIslandUpperRight]
        
        
        for case let cartesianPoint in cartesianPointsArray {
            cartesianPointsBox.addChild(cartesianPoint)
        }
        
        cartesianPointsBox.isHidden = true
        
        return cartesianPointsBox
    }
    
        func navigateToNextScreen() {
            
            if let mapImage = self.view?.texture(from: interactibleMap) {
               let image =  UIImage(cgImage: mapImage.cgImage())
                controller?.image = image
            }
            
            controller?.navigate = true
            
        }
    
    func createTheTutorialLabels() -> [SKSpriteNode] {
        
        let spriteNode1 = SKSpriteNode(color: .clear, size:  CGSize(width: interactibleMap.oceanTexture.frame.width, height: 0.3 * interactibleMap.oceanTexture.frame.height))
        
        spriteNode1.position = CGPoint(x: 0, y: interactibleMap.oceanTexture.position.y + interactibleMap.oceanTexture.frame.height/2 - spriteNode1.frame.height/2 - 8)
              
        spriteNode1.zPosition = 10
        
        let labelNode1 = SKLabelNode(text: "Now, we need to reveal the")
        labelNode1.fontSize = 36.0
        labelNode1.color = .red
        labelNode1.fontName = "LuckiestGuy-Regular"
        labelNode1.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        labelNode1.position = CGPoint(x: 0, y: 0 )
        labelNode1.numberOfLines = 0
        labelNode1.preferredMaxLayoutWidth = spriteNode1.frame.width * 0.95
        labelNode1.horizontalAlignmentMode = .center
        spriteNode1.addChild(labelNode1)
        
        let labelNode1_2 = SKLabelNode(text: "elements of our map!")
        labelNode1_2.fontSize = 36.0
        labelNode1_2.color = .red
        labelNode1_2.fontName = "LuckiestGuy-Regular"
        labelNode1_2.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        labelNode1_2.position = CGPoint(x: 0, y: -spriteNode1.frame.height/4)
        labelNode1_2.numberOfLines = 0
        labelNode1_2.preferredMaxLayoutWidth = spriteNode1.frame.width * 0.95
        labelNode1_2.horizontalAlignmentMode = .center
        spriteNode1.addChild(labelNode1_2)
        
        
        let spriteNode2 = SKSpriteNode(color: .clear, size: CGSize(width: cartesianPointsBox.frame.width, height: cartesianPointsBox.frame.height))
                                      
        spriteNode2.position = CGPoint(x: cartesianPointsBox.position.x, y: cartesianPointsBox.position.y)
              
        spriteNode2.zPosition = cartesianPointsBox.zPosition - 1
    
        
        let labelNode2 = SKLabelNode(text: "The map says there is an obstacle at (9,6)!")
        labelNode2.fontSize = 36.0
        labelNode2.fontName = "LuckiestGuy-Regular"
        labelNode2.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        labelNode2.position = CGPoint(x: 0, y: 50)
        labelNode2.numberOfLines = 1
        labelNode2.preferredMaxLayoutWidth = spriteNode2.frame.width
        labelNode2.horizontalAlignmentMode = .center

        spriteNode2.addChild(labelNode2)
        
        
        let labelNode3 = SKLabelNode(text: "Click at the point on the map to reveal it")
        labelNode3.fontSize = 36.0
        labelNode3.fontName = "LuckiestGuy-Regular"
        labelNode3.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        labelNode3.position = CGPoint(x: 0, y: -20)
        labelNode3.numberOfLines = 1
        labelNode3.preferredMaxLayoutWidth = spriteNode2.frame.width
        labelNode3.horizontalAlignmentMode = .center
        
        spriteNode2.addChild(labelNode3)
        
        spriteNode2.isHidden = false
        
        //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        
        let spriteNode3 = SKSpriteNode(color: .clear, size: CGSize(width: interactibleMap.oceanTexture.frame.width, height: 0.3*interactibleMap.oceanTexture.frame.height))
                                      
        spriteNode3.position = CGPoint(x: 0, y: interactibleMap.oceanTexture.position.y + interactibleMap.oceanTexture.frame.height/2 - (spriteNode1.frame.height/2 + interactibleMap.oceanTexture.frame.height * 0.2))
        spriteNode3.zPosition = spriteNode1.zPosition
        
        let labelNode4 = SKLabelNode(text: "Nice!")
        labelNode4.fontSize = 36.0
        labelNode4.fontName = "LuckiestGuy-Regular"
        labelNode4.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        labelNode4.position = CGPoint(x: 0, y: spriteNode3.frame.height/2)
        labelNode4.numberOfLines = 0
        labelNode4.preferredMaxLayoutWidth = spriteNode3.frame.width
        labelNode4.horizontalAlignmentMode = .center

        spriteNode3.addChild(labelNode4)

        
        let labelNode5 = SKLabelNode(text: "Now you have to click at all the other")
        labelNode5.fontSize = 36.0
        labelNode5.fontName = "LuckiestGuy-Regular"
        labelNode5.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        labelNode5.position = CGPoint(x: 0, y: 0)
        labelNode5.numberOfLines = 0
        labelNode5.preferredMaxLayoutWidth = spriteNode3.frame.width
        labelNode5.horizontalAlignmentMode = .center

        spriteNode3.addChild(labelNode5)
        
        let labelNode6 = SKLabelNode(text: "points to reveal the whole map")
        labelNode6.fontSize = 36.0
        labelNode6.fontName = "LuckiestGuy-Regular"
        labelNode6.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        labelNode6.position = CGPoint(x: 0, y: -spriteNode3.frame.height/4)
        labelNode6.numberOfLines = 0
        labelNode6.preferredMaxLayoutWidth = spriteNode3.frame.width
        labelNode6.horizontalAlignmentMode = .center

        spriteNode3.addChild(labelNode6)

        let tutorialLabels = [spriteNode1, spriteNode2, spriteNode3]
        
        return tutorialLabels
    }
        
}
    



