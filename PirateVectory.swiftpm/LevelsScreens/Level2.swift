import SpriteKit

class Level2: SKScene {
    
    var redVector = SKSpriteNode(imageNamed: Level2Strings.resultantVector.rawValue)
    let interactibleMap = InteractibleMap()
    var backgroundTexture = SKSpriteNode(imageNamed: Level1Strings.backgroundTexture.rawValue)
    var controller: GameController?
    var pileOfPoints = [CGPoint]()  // Pilha para armazenar informações do tipo CGPoint
    var cartesianPointsArray: [CartesianPointImage] = []
    var cartesianPointsBox = SKSpriteNode(texture: nil, color: .clear, size: CGSize(width: 0, height: 0))
    var stepsLabels: [SKSpriteNode] = []
    var tutorialElements: [SKSpriteNode] = []
    var numberOfVectorsOnScreen: Int = 0
    var arrayOfChosenVectors: [CGPoint] = []
    var listOfVectorsOnScreen: [SKSpriteNode] = []
    var tryAgainPopUp = TryAgainPopUp()
    
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
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let corDeFundo = UIColor(ColorsConstants.screenBackgroundColor)
        self.backgroundColor = corDeFundo
        
        addChild(tryAgainPopUp)
        tryAgainPopUp.isHidden = true
        tryAgainPopUp.zPosition = 20
        
        addChild(interactibleMap)
        interactibleMap.zPosition = 1
        
        redVector = addResultantToScreen()
    
        interactibleMap.addChild(redVector)

        addPointToPile(xValue: redVector.position.x, yValue: redVector.position.y)
        
        for obstacle in interactibleMap.mapObstaclesArray{
            obstacle.alpha = 1
        }
        
        cartesianPointsBox = createTheVectorsOptionsBox()
        
        addChild(cartesianPointsBox)
       
        stepsLabels = addStepsLabels()
        
        addChild(stepsLabels[0])
        addChild(stepsLabels[1])
        
        tutorialElements = addTutorialElementsToScreen()
        
        addChild(tutorialElements[0])
        addChild(tutorialElements[1])
        addChild(tutorialElements[2])
        

               
        
        //depois, preisamos determinar se o jogador venceu ou não e, assim, mudar para a próxima tela
            //aqui dentro, precisamos rejeitar quando um vetor se sobrepor a um MapObstacle
        
        //fazer os ajustes finos de design do level2
            //importar uma imagem de vetor mais bonitinha
        
        //fazer o tutorial do level2
            //fazer o label de steps só aparecr depois que os labels de tutorial sumirem
        
        //ajustar o popUp
            //deixar as quinas do opoup arredondadas
            //colocar o backgroundTexture no popUp
            //colocar os labels no popUp
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            
            var location = touch.location(in: self)
            
            if tryAgainPopUp.isHidden == false {
                tryAgainPopUp.isHidden = true
                removeVectorFromScreen()
            }

            
            if cartesianPointsBox.contains(location){
                
                location = touch.location(in: cartesianPointsBox)
                
                for case let element as CartesianPointImage in cartesianPointsArray {
                    
                    if element.contains(location) {
                        addVectorsToScreen(xValue: element.associatedXValue!, yValue: element.associatedYValue!)
                        numberOfVectorsOnScreen += 1
                        
                        if numberOfVectorsOnScreen >= 1 {
                            stepsLabels[0].isHidden = true
                            stepsLabels[1].isHidden = false
                        } else {
                            stepsLabels[0].isHidden = false
                            stepsLabels[1].isHidden = true
                        }
                        
                        if numberOfVectorsOnScreen == 2 {
                            if arrayOfChosenVectors[0] == CGPoint(x: 6, y: 4) && arrayOfChosenVectors[1] == CGPoint(x: 1, y: 6) {
                                navigateToNextScreen()

                            } else {
                                //exibir aqui uma mensagem na tela dizendo para tentar de novo
                                arrayOfChosenVectors = []
                                numberOfVectorsOnScreen = 0
                                stepsLabels[0].isHidden = false
                                stepsLabels[1].isHidden = true
                                print("antes")
                                print(pileOfPoints)
                                pileOfPoints = []
                                print("depois")
                                print(pileOfPoints)
                                addPointToPile(xValue: redVector.position.x, yValue: redVector.position.y)
                                
                                tryAgainPopUp.isHidden = false
                                
                            }
                        }
                        
                        
                        
                    }
            
                }
                
                
            } else {
                tutorialElements[2].isHidden = false
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if tutorialElements[2].isHidden == false{
            tutorialElements[2].isHidden = true
        }
        
        if tutorialElements[0].isHidden == false {
            tutorialElements[0].isHidden = true
        }
        
        if tutorialElements[1].isHidden == false {
            tutorialElements[1].isHidden = true
        }
        
    }
        
    func addTutorialElementsToScreen() -> [SKSpriteNode] {
        
        let boxWidth = 0.85 * screenWidth
        let boxHeight = 0.18 * screenHeight
        
        let circleAndArrowTexture = SKTexture(imageNamed: "circleAndArrow")
        let circleAndArrowWidth = 0.28*screenWidth
        let circleAndArrowHeight = 1.7*circleAndArrowWidth
        let circleAndArrowNode = SKSpriteNode(texture: circleAndArrowTexture, size: CGSize(width: circleAndArrowWidth, height: circleAndArrowHeight))
        circleAndArrowNode.position = CGPoint(x: -boxWidth/3 + 0.23*circleAndArrowWidth, y: interactibleMap.position.y - (interactibleMap.size.height/4 + 1.5*verticalSpacing) + 0.525*circleAndArrowHeight)
        circleAndArrowNode.zPosition = 10
        
        
        let spriteNodeTutorialLabelNode = SKSpriteNode(color: .clear, size:  CGSize(width: interactibleMap.oceanTexture.frame.width, height: 0.1 * interactibleMap.oceanTexture.frame.height))
        spriteNodeTutorialLabelNode.position = CGPoint(x: 0, y: screenHeight * 0.1)
        spriteNodeTutorialLabelNode.zPosition = 10
        
        let tutorialLabel = SKLabelNode(text: "Just tap on the vectors to build the path")
        tutorialLabel.fontSize = 33.0
        tutorialLabel.color = .red
        tutorialLabel.fontName = "LuckiestGuy-Regular"
        tutorialLabel.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        tutorialLabel.position = CGPoint(x: 0, y: 0 )
        tutorialLabel.numberOfLines = 1
        tutorialLabel.preferredMaxLayoutWidth = spriteNodeTutorialLabelNode.frame.width * 0.95
        tutorialLabel.horizontalAlignmentMode = .center
        spriteNodeTutorialLabelNode.addChild(tutorialLabel)
        
        let redBoxTexture = SKTexture(imageNamed: "dashedRedBox")
        let redDasheBoxNode = SKSpriteNode(texture: redBoxTexture, size: CGSize(width: boxWidth, height: boxHeight))
        redDasheBoxNode.position = CGPoint(x: 0, y: interactibleMap.position.y - (interactibleMap.size.height/4 + 1.5*verticalSpacing))
        redDasheBoxNode.zPosition = 10
        
        redDasheBoxNode.isHidden = true

        let tutorialElements = [circleAndArrowNode, spriteNodeTutorialLabelNode, redDasheBoxNode]
        
        return tutorialElements
    }
    
   
    
    func addStepsLabels() -> [SKSpriteNode] {
        let spriteNode1 = SKSpriteNode(color: .clear, size:  CGSize(width: interactibleMap.oceanTexture.frame.width, height: 0.1 * interactibleMap.oceanTexture.frame.height))
        
        spriteNode1.position = CGPoint(x: 0, y: -screenHeight * 0.23)
                      
        spriteNode1.zPosition = 10
        
        let labelNode1 = SKLabelNode(text: "Step 1 of 2")
        labelNode1.fontSize = 36.0
        labelNode1.color = .red
        labelNode1.fontName = "LuckiestGuy-Regular"
        labelNode1.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        labelNode1.position = CGPoint(x: 0, y: 0 )
        labelNode1.numberOfLines = 1
        labelNode1.preferredMaxLayoutWidth = spriteNode1.frame.width * 0.95
        labelNode1.horizontalAlignmentMode = .center
        spriteNode1.addChild(labelNode1)
        
        
        let spriteNode2 = SKSpriteNode(color: .clear, size:  CGSize(width: interactibleMap.oceanTexture.frame.width, height: 0.1 * interactibleMap.oceanTexture.frame.height))
        
        spriteNode2.position = CGPoint(x: 0, y: -screenHeight * 0.23)
                    
        spriteNode2.zPosition = 10
        
        let labelNode2 = SKLabelNode(text: "Step 2 of 2")
        labelNode2.fontSize = 36.0
        labelNode2.fontName = "LuckiestGuy-Regular"
        labelNode2.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        labelNode2.position = CGPoint(x: 0, y: 0 )
        labelNode2.numberOfLines = 1
        labelNode2.preferredMaxLayoutWidth = spriteNode2.frame.width * 0.95
        labelNode2.horizontalAlignmentMode = .center
        spriteNode2.addChild(labelNode2)
        
        spriteNode1.isHidden = false
        spriteNode2.isHidden = true
        
        let tutorialLabels = [spriteNode1, spriteNode2]
            
        return tutorialLabels
    }
    
    func addVectorsToScreen(xValue: Double, yValue: Double) {
        
        let oppositeSide = yValue*interactibleMap.oceanTexture.size.height/12.0
        let adjacentSide = xValue*interactibleMap.oceanTexture.size.width/11.0
       
        let newVectorMagnetude = sqrt(oppositeSide*oppositeSide + adjacentSide*adjacentSide)
                
        let newVector = SKSpriteNode(imageNamed: "HorizontalAxe")
        
        newVector.zPosition = 5
        newVector.size.width = newVectorMagnetude
        newVector.anchorPoint = CGPoint(x: 0, y: 0.5)
        newVector.zRotation = atan((oppositeSide)/(adjacentSide))
        newVector.position = peekAtTopPoint()!
        
        interactibleMap.addChild(newVector)
        
        checkOverlapWithObstacles(newVector: newVector)
        
        let previousPoint = peekAtTopPoint()
        let previousXPoint = previousPoint?.x
        let previousYPoint = previousPoint?.y

        addPointToPile(xValue: previousXPoint! + adjacentSide, yValue: previousYPoint! + oppositeSide)
        
        arrayOfChosenVectors.append(CGPoint(x: xValue, y: yValue))
        
        listOfVectorsOnScreen.append(newVector)
    }
    
    func removeVectorFromScreen() {
        for vector in listOfVectorsOnScreen{
            vector.removeFromParent()
        }
        listOfVectorsOnScreen = []
    }
    
    func checkOverlapWithObstacles(newVector: SKNode) {
        for case let obstacle as MapObstacle in interactibleMap.mapObstaclesArray {
            if newVector.frame.intersects(obstacle.frame) {
                print("Inválido: Novo objeto se sobrepõe a um obstáculo.")
                //numberOfVectorsOnScreen = 0
                
                // Adicione qualquer ação que você deseja realizar quando houver sobreposição.
            }
        }
    }
    
    func addPointToPile(xValue: CGFloat, yValue: CGFloat) {
          let point = CGPoint(x: xValue, y: yValue)
          pileOfPoints.append(point)
    }
    
    func peekAtTopPoint() -> CGPoint? {
            return pileOfPoints.last
    }
    
    func popPointFromPile() -> CGPoint? {
            if let lastPoint = pileOfPoints.popLast() {
                return lastPoint
            } else {
                return nil
            }
    }
    
    
    func addResultantToScreen() -> SKSpriteNode{
        
        let vectorMagnetud = sqrt((7*interactibleMap.oceanTexture.size.width/11)*(7*interactibleMap.oceanTexture.size.width/11) + (10*interactibleMap.oceanTexture.size.height/12)*(10*interactibleMap.oceanTexture.size.height/12))
        
        let vectorPositionX = interactibleMap.oceanTexture.position.x - interactibleMap.oceanTexture.size.width/2
        let vectorPositionY = interactibleMap.oceanTexture.position.y - interactibleMap.oceanTexture.size.height/2
        
        redVector.zPosition = 5
        redVector.anchorPoint = CGPoint(x: 0, y: 0.5)
        redVector.size.width = vectorMagnetud
        redVector.position = CGPoint(x:vectorPositionX , y:vectorPositionY)
       
        redVector.zRotation = atan((10*interactibleMap.oceanTexture.size.height/12.0)/(7*interactibleMap.oceanTexture.size.width/11.0))

        return redVector
    }
    
    func createTheVectorsOptionsBox() ->  SKSpriteNode {
        
        let boxWidth = 0.85 * screenWidth
        let boxHeight = 0.2 * screenHeight
        
        let boxPosition = CGPoint(x: 0, y: interactibleMap.position.y - (interactibleMap.size.height/4 + 1.5*verticalSpacing))
        
        cartesianPointsBox.size = CGSize(width: boxWidth, height: boxHeight)
        cartesianPointsBox.position = boxPosition
        cartesianPointsBox.zPosition = 5
        
        let imageNodeWidth = 0.18 * boxWidth
        
        let Image_Option_6_4 = CartesianPointImage(imageName: "(6,4)", anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: -boxWidth/3, y: boxHeight/4), imageNodeWidth:  0.18 * boxWidth, associatedXValue: 6, associatedYValue: 4)
        
        let Image_Option_9_3 = CartesianPointImage(imageName: "(9,3)", anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: boxWidth/3, y: boxHeight/4), imageNodeWidth:  0.18 * boxWidth, associatedXValue: 9, associatedYValue: 3)

        let Image_Option_3_8 = CartesianPointImage(imageName: "(3,8)", anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: -boxWidth/3, y: -boxHeight/4), imageNodeWidth:  0.18 * boxWidth, associatedXValue: 3, associatedYValue: 8)
        
        let Image_Option_1_5 = CartesianPointImage(imageName: "(1,6)", anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: boxWidth/3, y: -boxHeight/4), imageNodeWidth:  0.18 * boxWidth, associatedXValue: 1, associatedYValue: 6)
        
        let Image_Option_0_9 = CartesianPointImage(imageName: "(1,9)", anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: 0, y: 0), imageNodeWidth:  0.18 * boxWidth, associatedXValue: 1, associatedYValue: 9)

        cartesianPointsArray = [Image_Option_6_4, Image_Option_1_5, Image_Option_9_3, Image_Option_3_8, Image_Option_0_9]
        
        for case let cartesianPoint in cartesianPointsArray {
            cartesianPointsBox.addChild(cartesianPoint)
        }
        
        cartesianPointsBox.isHidden = false
        
        return cartesianPointsBox
    }

    func navigateToNextScreen() {
        controller?.navigate = true
    }
    
}




