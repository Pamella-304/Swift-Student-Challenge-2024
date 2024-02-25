import SpriteKit

class Level2: SKScene {
    
    var redVector = SKSpriteNode(imageNamed: Level2Strings.resultantVector.rawValue)
    let interactibleMap = InteractibleMap()
    var backgroundTexture = SKSpriteNode(imageNamed: Level1Strings.backgroundTexture.rawValue)
    var controller: GameController?
    var pileOfPoints = [CGPoint]()  // Pilha para armazenar informações do tipo CGPoint
    var cartesianPointsArray: [CartesianPointImage] = []
    var cartesianPointsBox = SKSpriteNode(texture: nil, color: .clear, size: CGSize(width: 0, height: 0))
    
    
    
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
       
       
        //em seguida, devemos fazer a função que remove vetores da tela e reativa a opção de escolhe-los novamente
        
        //depois, preisamos determinar se o jogador venceu ou não e, assim, mudar para a próxima tela
            //aqui dentro, precisamos rejeitar quando um vetor se sobrepor a um MapObstacle
        
        //fazer os ajustes finos de design do level2
            //escolher o numero de opcoes de vetores (acho que vai ser 4)
            //escolher as opcpes adequadas de vetores
            //importar uma imagem de vetor mais bonitinha
            //fazer os labels (step 1 of 3)
        
        //fazer o tutorial do level2
            //fazer o circulo com uma seta aparecer na tela, mandando a pessoa clicar
            //fazer a frase aparecer antes de clicar
            //fazer ambos sumirem quando a pessoa clicar
            //criar um curculo pontilhado vermelho entorno da caixa que some e aparece
            //fazer a caixa de vetor ser circulada quando a pessoa clicar fora do lugar correto
        
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
        
    }
    
    func checkOverlapWithObstacles(newVector: SKNode) {
        for case let obstacle as MapObstacle in interactibleMap.mapObstaclesArray {
            if newVector.frame.intersects(obstacle.frame) {
                print("Inválido: Novo objeto se sobrepõe a um obstáculo.")
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
                        
            var location = touch.location(in: cartesianPointsBox)
            
            for case let element as CartesianPointImage in cartesianPointsArray {
                
                if element.contains(location) {
                    addVectorsToScreen(xValue: element.associatedXValue!, yValue: element.associatedYValue!)

                }
            }
            
        
        }
        
        
    }
    
    func navigateToNextScreen() {
        controller?.navigate = true
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
        let boxHeight = (screenHeight - interactibleMap.size.height)/3
        
        let boxPosition = CGPoint(x: 0, y: interactibleMap.position.y - (interactibleMap.size.height/4 + verticalSpacing))
        
        //let boxPosition = CGPoint(x: 0, y: interactibleMap.position.y - (interactibleMap.scene?.size.height ?? 0 / 4  + verticalSpacing))
               
        //let cartesianPointsBox = SKSpriteNode(color: .clear, size: CGSize(width: boxWidth, height: boxHeight))
        cartesianPointsBox.size = CGSize(width: boxWidth, height: boxHeight)
        cartesianPointsBox.position = boxPosition
        cartesianPointsBox.zPosition = 3
        
        let imageNodeWidth = 0.18 * boxWidth
        
        let Image_Option_8_10 = CartesianPointImage(imageName: "(8,10)", anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: 0, y: 0), imageNodeWidth:  0.18 * boxWidth, associatedXValue: 8, associatedYValue: 10)
                
        let Image_Option_2_3 = CartesianPointImage(imageName: "(2,3)", anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: -boxWidth/2, y: 0), imageNodeWidth:  0.18 * boxWidth, associatedXValue: 2, associatedYValue: 3)

        let Image_Option_5_7 = CartesianPointImage(imageName: "(5,7)", anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: boxWidth/2, y: 0), imageNodeWidth:  0.18 * boxWidth, associatedXValue: 5, associatedYValue: 7)

        cartesianPointsArray = [Image_Option_8_10, Image_Option_2_3, Image_Option_5_7]
        
        for case let cartesianPoint in cartesianPointsArray {
            cartesianPointsBox.addChild(cartesianPoint)
        }
        
        cartesianPointsBox.isHidden = false
        
        return cartesianPointsBox
    }

}




