
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
    var backgroundTexture = SKSpriteNode(imageNamed: Level1Strings.backgroundTexture.rawValue)
    
    
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
            
            var location = touch.location(in: self)
            print(location)
            
            if interactibleMap.oceanTexture.contains(location) {
                
                location = touch.location(in: interactibleMap.oceanTexture)
                
                for case let obstacle as MapObstacle in interactibleMap.mapObstaclesArray {
                    
                    
                    
                    if obstacle.contains(location) {
                        print("Obstacle contains touch location!")
                        
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
               
        let ImagesBox = SKSpriteNode(color: .clear, size: CGSize(width: boxWidth, height: boxHeight))
        ImagesBox.position = boxPosition
        ImagesBox.zPosition = 10
        
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
            ImagesBox.addChild(cartesianPoint)
        }
                
        return ImagesBox
    }
    
        func navigateToNextScreen() {
            
            if let mapImage = self.view?.texture(from: interactibleMap) {
               let image =  UIImage(cgImage: mapImage.cgImage())
                controller?.image = image
            }
            
            controller?.navigate = true
            
        }
    
        
}
    



