
import SpriteKit

class InteractibleMap: SKNode {
    
    var oceanTexture = SKSpriteNode(imageNamed: InteractibleMapNodesStrings.oceanTexture.rawValue)
    var verticalAxe = SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalAxe.rawValue)
    var horizontalAxe = SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalAxe.rawValue)
    var pirateShip = SKSpriteNode(imageNamed: InteractibleMapNodesStrings.pirateShip.rawValue)
    var redCircle = SKSpriteNode(imageNamed: InteractibleMapNodesStrings.redCircle.rawValue)
    var Grid = SKNode()
    var mapObstaclesArray: [SKNode] = []
    
    let yIndice: SKSpriteNode = SKSpriteNode(imageNamed: InteractibleMapNodesStrings.yIndice.rawValue)
    let xIndice: SKSpriteNode = SKSpriteNode(imageNamed: InteractibleMapNodesStrings.xIndice.rawValue)

    var verticalIndices: [SKSpriteNode] = [SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalIndice0.rawValue),
                                           SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalIndice1.rawValue),
                                           SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalIndice2.rawValue),
                                           SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalIndice3.rawValue),
                                           SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalIndice4.rawValue), 
                                           SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalIndice5.rawValue),
                                           SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalIndice6.rawValue),
                                           SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalIndice7.rawValue),
                                           SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalIndice8.rawValue),
                                           SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalIndice9.rawValue),
                                           SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalIndice10.rawValue),
                                           SKSpriteNode(imageNamed: InteractibleMapNodesStrings.verticalIndice11.rawValue)]
    
    var horizontalIndices: [SKSpriteNode] = [SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalIndice0.rawValue),
                                             SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalIndice1.rawValue),
                                             SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalIndice2.rawValue),
                                             SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalIndice3.rawValue),
                                             SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalIndice4.rawValue),
                                             SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalIndice5.rawValue),
                                             SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalIndice6.rawValue),
                                             SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalIndice7.rawValue),
                                             SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalIndice8.rawValue),
                                             SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalIndice9.rawValue),
                                             SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalIndice10.rawValue),
                                             SKSpriteNode(imageNamed: InteractibleMapNodesStrings.horizontalIndice11.rawValue)]
    
    
    var size: CGSize = .zero
        
    func sceneDidLoad() {
        
        self.size = myScreenSize
        
        self.scene?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    
        addCartesianPlan()
        
        addCartesianIndices()
        
        Grid = createGrid(container: Grid)
        addChild(Grid)
        
        mapObstaclesArray = createMapObstaclesArray()
        
        for obstacle in mapObstaclesArray {
            oceanTexture.addChild(obstacle)

        }
        
        addTutorialElements()
        
    }
    
    
    func addTutorialElements() {
        
        let widthSizeUnity = oceanTexture.size.width/11.0
        let heightSizeUnity = oceanTexture.size.height/12.0
        
        oceanTexture.addChild(redCircle)
        redCircle.zPosition = 4
        redCircle.size = CGSize(width: widthSizeUnity*1.2, height: widthSizeUnity*1.2)
        redCircle.position = CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*9, y: -oceanTexture.size.height/2 + heightSizeUnity * 6)
        redCircle.alpha = 0.0
        
    }
    
    
    func addCartesianPlan() {
        let oceanTextureWidth = 0.85 * screenWidth
        let oceanTextureHeight = 0.92 * oceanTextureWidth
        
        addElementOnScreen(elementName: oceanTexture, elementZPosition: 2, elementSize: CGSize(width: oceanTextureWidth, height: oceanTextureHeight), elementAnchorPoint: CGPoint(x: 0.5, y: 0.5), elementPosition: CGPoint(x: 0, y: self.size.height/2 - (oceanTextureHeight/2 + verticalSpacing)))
        
        addElementOnScreen(elementName: horizontalAxe, elementZPosition: 4, elementSize: CGSize(width: oceanTexture.size.width*1.05, height: oceanTexture.size.width*0.05), elementAnchorPoint: CGPoint(x: 0, y: 0.5), elementPosition: CGPoint(x: oceanTexture.anchorPoint.x * (1 - oceanTexture.size.width), y: oceanTexture.position.y - oceanTexture.size.height/2 + 1))
        
        addElementOnScreen(elementName: verticalAxe, elementZPosition: 4, elementSize: CGSize(width: oceanTexture.size.width*0.05, height: oceanTexture.size.height*1.05), elementAnchorPoint: CGPoint(x: 0.5, y: 0), elementPosition: CGPoint(x: oceanTexture.anchorPoint.x * (1 - oceanTexture.size.width), y: oceanTexture.position.y-oceanTexture.size.height/2))
        
        addElementOnScreen(elementName: pirateShip, elementZPosition: 6, elementSize: CGSize(width: oceanTextureWidth*0.07, height: oceanTextureWidth*0.07 * 1.7), elementAnchorPoint: CGPoint(x: 0.5, y: 0.5), elementPosition: CGPoint(x: oceanTexture.anchorPoint.x * (1 - oceanTexture.size.width) , y: oceanTexture.position.y - oceanTexture.size.height/2 + 1))
        
        pirateShip.zRotation = -CGFloat.pi / 4

    }
    
    
    func addCartesianIndices() {
        
        let indicesHeight = oceanTexture.size.height/(12*1.2)
        let indicesWidth = indicesHeight*0.8
      
        //Vertical Indices:
        
        addElementOnScreen(elementName: verticalIndices[0], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 1, y:0.5), elementPosition: CGPoint(x: verticalAxe.position.x - (indicesWidth*0.2), y: verticalAxe.position.y))
        
        addElementOnScreen(elementName: verticalIndices[1], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 1, y:0.5), elementPosition: CGPoint(x: verticalAxe.position.x - (indicesWidth*0.2), y: verticalAxe.position.y + (oceanTexture.size.height/12)))
        
        addElementOnScreen(elementName: verticalIndices[2], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 1, y:0.5), elementPosition: CGPoint(x: verticalAxe.position.x - (indicesWidth*0.2), y: verticalAxe.position.y + (2 * oceanTexture.size.height/12)))

        addElementOnScreen(elementName: verticalIndices[3], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 1, y:0.5), elementPosition: CGPoint(x: verticalAxe.position.x - (indicesWidth*0.2), y: verticalAxe.position.y + (3 * oceanTexture.size.height/12)))
        
        addElementOnScreen(elementName: verticalIndices[4], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 1, y:0.5), elementPosition: CGPoint(x: verticalAxe.position.x - (indicesWidth*0.2), y: verticalAxe.position.y + (4 * oceanTexture.size.height/12)))
        
        addElementOnScreen(elementName: verticalIndices[5], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 1, y:0.5), elementPosition: CGPoint(x: verticalAxe.position.x - (indicesWidth*0.2), y: verticalAxe.position.y + (5 * oceanTexture.size.height/12)))
        
        addElementOnScreen(elementName: verticalIndices[6], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 1, y:0.5), elementPosition: CGPoint(x: verticalAxe.position.x - (indicesWidth*0.2), y: verticalAxe.position.y + (6 * oceanTexture.size.height/12)))
        
        addElementOnScreen(elementName: verticalIndices[7], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 1, y:0.5), elementPosition: CGPoint(x: verticalAxe.position.x - (indicesWidth*0.2), y: verticalAxe.position.y + (7 * oceanTexture.size.height/12)))
        
        addElementOnScreen(elementName: verticalIndices[8], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 1, y:0.5), elementPosition: CGPoint(x: verticalAxe.position.x - (indicesWidth*0.2), y: verticalAxe.position.y + (8 * oceanTexture.size.height/12)))
        
        addElementOnScreen(elementName: verticalIndices[9], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 1, y:0.5), elementPosition: CGPoint(x: verticalAxe.position.x - (indicesWidth*0.2), y: verticalAxe.position.y + (9 * oceanTexture.size.height/12)))
        
        addElementOnScreen(elementName: verticalIndices[10], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 1, y:0.5), elementPosition: CGPoint(x: verticalAxe.position.x - (indicesWidth*0.2), y: verticalAxe.position.y + (10 * oceanTexture.size.height/12)))
        
        addElementOnScreen(elementName: verticalIndices[11], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 1, y:0.5), elementPosition: CGPoint(x: verticalAxe.position.x - (indicesWidth*0.2), y: verticalAxe.position.y + (11 * oceanTexture.size.height/12)))
        
        addElementOnScreen(elementName: yIndice, elementZPosition: 1, elementSize: CGSize(width: (indicesWidth * 1.3), height: (indicesHeight * 1.3)), elementAnchorPoint: CGPoint(x: 1, y: 0.5), elementPosition: CGPoint(x: verticalAxe.position.x, y: verticalAxe.position.y + (verticalAxe.size.height * 0.97)))
    
    
        //Horizontal Indices:
         
        addElementOnScreen(elementName: horizontalIndices[0], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 0.5, y:1), elementPosition: CGPoint(x: horizontalAxe.position.x , y: horizontalAxe.position.y - (indicesWidth*0.2)))

        addElementOnScreen(elementName: horizontalIndices[1], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 0.5, y:1), elementPosition: CGPoint(x: horizontalAxe.position.x + ( oceanTexture.size.width/11), y: horizontalAxe.position.y - (indicesWidth*0.2)))
        
        addElementOnScreen(elementName: horizontalIndices[2], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 0.5, y:1), elementPosition: CGPoint(x: horizontalAxe.position.x + (2 *  oceanTexture.size.width/11), y: horizontalAxe.position.y - (indicesWidth*0.2)))
        
        addElementOnScreen(elementName: horizontalIndices[3], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 0.5, y:1), elementPosition: CGPoint(x: horizontalAxe.position.x + (3 *  oceanTexture.size.width/11), y: horizontalAxe.position.y - (indicesWidth*0.2)))
        
        addElementOnScreen(elementName: horizontalIndices[4], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 0.5, y:1), elementPosition: CGPoint(x: horizontalAxe.position.x + (4 *  oceanTexture.size.width/11), y: horizontalAxe.position.y - (indicesWidth*0.2)))
        
        addElementOnScreen(elementName: horizontalIndices[5], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 0.5, y:1), elementPosition: CGPoint(x: horizontalAxe.position.x + (5 *  oceanTexture.size.width/11), y: horizontalAxe.position.y - (indicesWidth*0.2)))
        
        addElementOnScreen(elementName: horizontalIndices[6], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 0.5, y:1), elementPosition: CGPoint(x: horizontalAxe.position.x + (6 *  oceanTexture.size.width/11), y: horizontalAxe.position.y - (indicesWidth*0.2)))
        
        addElementOnScreen(elementName: horizontalIndices[7], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 0.5, y:1), elementPosition: CGPoint(x: horizontalAxe.position.x + (7 *  oceanTexture.size.width/11), y: horizontalAxe.position.y - (indicesWidth*0.2)))
        
        addElementOnScreen(elementName: horizontalIndices[8], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 0.5, y:1), elementPosition: CGPoint(x: horizontalAxe.position.x + (8 *  oceanTexture.size.width/11), y: horizontalAxe.position.y - (indicesWidth*0.2)))
        
        addElementOnScreen(elementName: horizontalIndices[9], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 0.5, y:1), elementPosition: CGPoint(x: horizontalAxe.position.x + (9 *  oceanTexture.size.width/11), y: horizontalAxe.position.y - (indicesWidth*0.2)))
        
        addElementOnScreen(elementName: horizontalIndices[10], elementZPosition: 1, elementSize: CGSize(width: indicesWidth, height: indicesHeight), elementAnchorPoint: CGPoint(x: 0.5, y:1), elementPosition: CGPoint(x: horizontalAxe.position.x + (10 *  oceanTexture.size.width/11), y: horizontalAxe.position.y - (indicesWidth*0.2)))

        addElementOnScreen(elementName: xIndice, elementZPosition: 1, elementSize: CGSize(width: (indicesWidth * 1.3), height: (indicesHeight * 1.3)), elementAnchorPoint: CGPoint(x: 0.5, y: 1), elementPosition: CGPoint(x: horizontalAxe.position.x + (horizontalAxe.size.width * 0.95), y: horizontalAxe.position.y))
      
    }
        
    func createGrid(container: SKNode) -> SKNode {
        
        let gridWidth = oceanTexture.size.width
        let gridHeight = oceanTexture.size.height
        let gridPosition = oceanTexture.position
        
        let numRows = 12
        let numCols = 11
        
        let cellSize = CGSize(width: gridWidth/CGFloat(numCols) + 1, height: gridHeight/CGFloat(numRows) + 1)
       
        for row in 0..<numRows {
            for col in 0..<numCols {
                var textureName = InteractibleMapNodesStrings.Tile
                if (row == 0 && col == 0){
                    textureName = InteractibleMapNodesStrings.TileCornerLowerLeft
                } else if row == 11 && col == 0 {
                    textureName = InteractibleMapNodesStrings.TileCornerUpperLeft
                } else if row == 0 && col == 10 {
                    textureName = InteractibleMapNodesStrings.TileCornerLowerRight
                } else if row == 11 && col == 10 {
                    textureName = InteractibleMapNodesStrings.TileCornerUpperRight
                } else if row == 0 {
                    textureName = InteractibleMapNodesStrings.TileCornerLowerRight
                } else if row == 11 {
                    textureName = InteractibleMapNodesStrings.TileUpperSide
                } else if col == 0 {
                    textureName = InteractibleMapNodesStrings.TileLeftSide
                } else if col == 10 {
                    textureName = InteractibleMapNodesStrings.TileRightSide
                }
                
                let texture = SKTexture(imageNamed: textureName.rawValue)
                
                let tile = SKSpriteNode(texture: texture, size: cellSize)
                
                let tileX = gridPosition.x - gridWidth/2 + CGFloat(col) * (cellSize.width - 1)
                let tileY = gridPosition.y - gridHeight/2 + CGFloat(row) * (cellSize.height - 1)
                
                tile.position = CGPoint(x: tileX + cellSize.width/2, y: tileY + cellSize.height/2)
                
                container.addChild(tile)
            }
        }
            container.zPosition = 3
            return container
    }
    
    func addElementOnScreen(elementName: SKSpriteNode, elementZPosition: CGFloat, elementSize: CGSize, elementAnchorPoint: CGPoint, elementPosition: CGPoint) {
        
        elementName.zPosition = elementZPosition
        elementName.size = elementSize
        elementName.position = elementPosition
        elementName.anchorPoint = elementAnchorPoint
        
        return addChild(elementName)
    }
    
    
    func createMapObstaclesArray() -> [SKNode] {
    
        let widthSizeUnity = oceanTexture.size.width/11.0
        let heightSizeUnity = oceanTexture.size.height/12.0
        
        let smallIsland = MapObstacle(textureName: SKTexture(imageNamed: InteractibleMapNodesStrings.smallIsland.rawValue), 
                                      position: CGPoint(x:-oceanTexture.size.width/2 + widthSizeUnity*2, y:-oceanTexture.size.height/2 + heightSizeUnity*3),
                                      color: .clear,
                                      size: CGSize(width: widthSizeUnity, height: widthSizeUnity*1.05),
                                      associatedCartesianPoint: InteractibleMapNodesStrings.smallIslandPosition.rawValue)
     
        let mediumIsland = MapObstacle(textureName: SKTexture(imageNamed: InteractibleMapNodesStrings.mediumIsland.rawValue), 
                                       position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*7, y: -oceanTexture.size.height/2 + heightSizeUnity*3),
                                       color: .clear,
                                       size: CGSize(width: widthSizeUnity*1.6, height: widthSizeUnity*1.6*0.93),
                                       associatedCartesianPoint: InteractibleMapNodesStrings.mediumIslandPosition.rawValue)
        
        let rock = MapObstacle(textureName: SKTexture(imageNamed: InteractibleMapNodesStrings.rock.rawValue), 
                               position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*9, y: -oceanTexture.size.height/2 + heightSizeUnity * 6),
                               color: .clear,
                               size: CGSize(width: widthSizeUnity*1.2, height: widthSizeUnity*1.2*0.78),
                               associatedCartesianPoint: InteractibleMapNodesStrings.rockPosition.rawValue)
        
        let greenShip = MapObstacle(textureName: SKTexture(imageNamed: InteractibleMapNodesStrings.greenShip.rawValue), 
                                    position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*5, y: -oceanTexture.size.height/2 + heightSizeUnity * 7 ),
                                    color: .clear,
                                    size: CGSize(width: widthSizeUnity*0.5, height: widthSizeUnity*0.5*1.91),
                                    associatedCartesianPoint: InteractibleMapNodesStrings.greenShipPosition.rawValue)
        
        let bigIslandPart_LowerLeft = MapObstacle(textureName: SKTexture(imageNamed: InteractibleMapNodesStrings.bigIslandLowerLeft.rawValue), 
                                                  position: CGPoint(x: -oceanTexture.size.width/2 + (widthSizeUnity * 7.8), y: -oceanTexture.size.height/2 + (heightSizeUnity * 10) ),
                                                  color: .clear,
                                                  size: CGSize(width: widthSizeUnity*1.55, height: heightSizeUnity * 1.4),
                                                  associatedCartesianPoint: InteractibleMapNodesStrings.bigIslandLowerLeftPosition.rawValue)
        
        let bigIslandPart_UpperLeft = MapObstacle(textureName: SKTexture(imageNamed: InteractibleMapNodesStrings.bigIslandUpperLeft.rawValue), 
                                                  position: CGPoint(x: -oceanTexture.size.width/2 + (widthSizeUnity*7.8) , y: -oceanTexture.size.height/2 + (heightSizeUnity*11.22)),
                                                  color: .clear,
                                                  size: CGSize(width: widthSizeUnity*1.55, height: heightSizeUnity*1.4),
                                                  associatedCartesianPoint: InteractibleMapNodesStrings.bigIslandUpperLeftPosition.rawValue)
        
        let bigIslandPart_LowerRight = MapObstacle(textureName: SKTexture(imageNamed: InteractibleMapNodesStrings.bigIslandLowerRight.rawValue),
                                                   position: CGPoint(x: (-oceanTexture.size.width/2 + (widthSizeUnity*8.95) ), y: (-oceanTexture.size.height/2 + (heightSizeUnity*10))),
                                                   color: .clear,
                                                   size: CGSize(width: widthSizeUnity*0.8, height: heightSizeUnity*1.4),
                                                   associatedCartesianPoint: InteractibleMapNodesStrings.bigIslandLowerRightPosition.rawValue)
        
        let bigIslandPart_UpperRight = MapObstacle(textureName: SKTexture(imageNamed: InteractibleMapNodesStrings.bigIslandUpperRight.rawValue),
                                                   position: CGPoint(x: (-oceanTexture.size.width/2 + (widthSizeUnity*9.15)), y: -oceanTexture.size.height/2 +  (heightSizeUnity*11.31)),
                                                   color: .clear, 
                                                   size: CGSize(width: widthSizeUnity*1.2, height:heightSizeUnity*1.25),
                                                   associatedCartesianPoint: InteractibleMapNodesStrings.bigIslandUpperRightPosition.rawValue)
        
        let mapObstaclesArray = [smallIsland, mediumIsland, rock, greenShip, bigIslandPart_LowerLeft, bigIslandPart_UpperLeft, bigIslandPart_LowerRight, bigIslandPart_UpperRight]

        return mapObstaclesArray
    }
    
    
}
