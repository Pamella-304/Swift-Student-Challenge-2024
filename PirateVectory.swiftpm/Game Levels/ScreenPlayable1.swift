//
//  ScreenPlayable1.swift
//  PirateVectory
//
//  Created by Pamella Alvarenga on 01/02/24.
//
import SwiftUI
import SpriteKit

class ScreenPlayable1: SKScene {
    
  //  @State private var navigationLinkIsActive6: Bool = false
    
    var oceanTexture = SKSpriteNode(imageNamed: "FundoMar")
    var backgroundTexture = SKSpriteNode(imageNamed: "BackgroundMapTexture")
    var verticalAxe = SKSpriteNode(imageNamed: "VerticalAxe")
    var horizontalAxe = SKSpriteNode(imageNamed: "HorizontalAxe")
    var pirateShip = SKSpriteNode(imageNamed: "PirateShip")
    let Grid = SKNode()
    var cartesianPointsContainer = SKNode()    
    var ImagesBox = SKSpriteNode()
    var mapObstaclesArray: [SKNode] = []
    var cartesianPointsArray: [SKNode] = []
    var node = SKSpriteNode()
    var revealedCartesianPoints: Int = 0
    
    override func didMove(to view: SKView) {
        
        let screenWidth = self.size.width
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let verticalSpacing = self.size.height * 0.065
        let oceanTextureWidth = 0.85 * self.size.width
        let oceanTextureHeight = 0.92 * oceanTextureWidth
        
        let corDeFundo = UIColor(ColorsConstants.screenBackgroundColor)
        
        self.backgroundColor = corDeFundo
        
        addElementOnScreen(elementName: backgroundTexture, elementZPosition: 0, elementSize: CGSize(width: self.size.width, height: self.size.height), elementAnchorPoint: CGPoint(x: 0.5, y: 0.5), elementPosition: CGPoint(x: 0, y: 0))
        
        addElementOnScreen(elementName: oceanTexture, elementZPosition: 1, elementSize: CGSize(width: oceanTextureWidth, height: oceanTextureHeight), elementAnchorPoint: CGPoint(x: 0.5, y: 0.5), elementPosition: CGPoint(x: 0, y: self.size.height/2 - (oceanTextureHeight/2 + verticalSpacing)))
        
        addElementOnScreen(elementName: horizontalAxe, elementZPosition: 3, elementSize: CGSize(width: oceanTexture.size.width*1.05, height: 12), elementAnchorPoint: CGPoint(x: 0, y: 0.5), elementPosition: CGPoint(x: oceanTexture.anchorPoint.x * (1 - oceanTexture.size.width), y: oceanTexture.position.y - oceanTexture.size.height/2 + 1))
        
        addElementOnScreen(elementName: verticalAxe, elementZPosition: 3, elementSize: CGSize(width: 12, height: oceanTexture.size.height*1.05), elementAnchorPoint: CGPoint(x: 0.5, y: 0), elementPosition: CGPoint(x: oceanTexture.anchorPoint.x * (1 - oceanTexture.size.width), y: oceanTexture.position.y-oceanTexture.size.height/2))
        
        addElementOnScreen(elementName: pirateShip, elementZPosition: 4, elementSize: CGSize(width: 18.0, height: 18.0 * 1.7), elementAnchorPoint: CGPoint(x: 0.5, y: 0.5), elementPosition: CGPoint(x: oceanTexture.anchorPoint.x * (1 - oceanTexture.size.width) , y: oceanTexture.position.y - oceanTexture.size.height/2 + 1))
        
        pirateShip.zRotation = -CGFloat.pi / 4
        
        createGrid(container: Grid)
        Grid.zPosition = 2
        addChild(Grid)
        
        let CartesianPointsBox = createTheCartesianPointsBox(verticalSpacing: verticalSpacing)
        
        self.addChild(CartesianPointsBox)
        
        mapObstaclesArray = createMapObstaclesArray()
        
        for obstacle in mapObstaclesArray {
            oceanTexture.addChild(obstacle)
        }
      //  NavigationLink("",destination: ScreenPlayable2(),isActive: $navigationLinkIsActive6)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: oceanTexture)
   
            for case let obstacle as MapObstacle in mapObstaclesArray {
                if obstacle.contains(location) {
                    if obstacle.isInteractible{
                        obstacle.toggleVisibility()
                        
                        for case let cartesianPoint as CartesianPointImage in cartesianPointsArray {
                            if obstacle.associatedCartesianPoint == cartesianPoint.imageName {
                                cartesianPoint.toggleVisibility()
                                revealedCartesianPoints += 1
                                if revealedCartesianPoints == 1 {
                                    navigateToNextLevel()
                                }
                            }
                        }
                    }
                }
            }

        }
    }
    

    func createTheCartesianPointsBox(verticalSpacing: CGFloat) ->  SKSpriteNode {
        
        let boxWidth = oceanTexture.size.width
        let boxPosition = CGPoint(x: 0, y: -(oceanTexture.size.height/2 + verticalSpacing/2))
        let boxHeight: CGFloat = self.size.height - (oceanTexture.size.height + 4 * verticalSpacing)

        let ImagesBox = SKSpriteNode(color: .clear, size: CGSize(width: boxWidth, height: boxHeight))
        ImagesBox.position = boxPosition
        ImagesBox.zPosition = 1
        
        let ImagePoint_9_6 = CartesianPointImage(imageName: "(9,6)",  anchorPoint: CGPoint(x: 0, y: 0.5), position: CGPoint(x: -boxWidth/2, y: boxHeight/2), imageNodeWidth: 50.0)

        let ImagePoint_2_3 = CartesianPointImage(imageName: "(2,3)",  anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: 0, y: boxHeight/2), imageNodeWidth: 50.0)

        let ImagePoint_7_3 = CartesianPointImage(imageName: "(7,3)",  anchorPoint: CGPoint(x: 1, y: 0.5), position: CGPoint(x: boxWidth/2, y: boxHeight/2), imageNodeWidth: 50.0)

        let ImagePoint_5_7 = CartesianPointImage(imageName: "(5,7)",  anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: -4.5*boxWidth/20, y: 0), imageNodeWidth: 50.0)

        let ImagePoint_8_10 = CartesianPointImage(imageName: "(8,10)",  anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: 4.5*boxWidth/20 , y: 0), imageNodeWidth: 50.0)

        let ImagePoint_8_11 = CartesianPointImage(imageName: "(8,11)",  anchorPoint: CGPoint(x: 0, y: 0.5), position: CGPoint(x: -boxWidth/2, y: -boxHeight/2), imageNodeWidth: 50.0)
        
        let ImagePoint_9_10 = CartesianPointImage(imageName: "(9,10)",  anchorPoint: CGPoint(x: 0.5, y: 0.5), position: CGPoint(x: 0, y: -boxHeight/2), imageNodeWidth: 50.0)
        
        let ImagePoint_9_11 = CartesianPointImage(imageName: "(9,11)",  anchorPoint: CGPoint(x: 1, y: 0.5), position: CGPoint(x: boxWidth/2, y: -boxHeight/2), imageNodeWidth: 50.0)
        
        cartesianPointsArray = [ImagePoint_9_6, ImagePoint_2_3, ImagePoint_7_3, ImagePoint_5_7, ImagePoint_8_10, ImagePoint_8_11, ImagePoint_9_10, ImagePoint_9_11]
        
        for case let cartesianPoint in cartesianPointsArray {
            ImagesBox.addChild(cartesianPoint)
        }
                
        return ImagesBox
    }
    
    
    func createMapObstaclesArray() -> [SKNode] {
    
        let widthSizeUnity = oceanTexture.size.width/11.0
        let heightSizeUnity = oceanTexture.size.height/12.0
        
        let smallIsland = MapObstacle(textureName: "SmallIsland", position: CGPoint(x:-oceanTexture.size.width/2 + widthSizeUnity*2, y:-oceanTexture.size.height/2 + heightSizeUnity*3), size: CGSize(width: widthSizeUnity, height: widthSizeUnity*1.05), associatedCartesianPoint: "(2,3)")
        
        let mediumIsland = MapObstacle(textureName: "MediumIsland", position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*7, y: -oceanTexture.size.height/2 + heightSizeUnity*3), size: CGSize(width: widthSizeUnity*1.8, height: widthSizeUnity*1.8*0.93), associatedCartesianPoint: "(7,3)")
        
        let rock = MapObstacle(textureName: "Rock", position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*9, y: -oceanTexture.size.height/2 + heightSizeUnity * 6), size: CGSize(width: widthSizeUnity*1.2, height: widthSizeUnity*1.2*0.78), associatedCartesianPoint: "(9,6)")
        
        let greenShip = MapObstacle(textureName: "GreenShip", position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*5, y: -oceanTexture.size.height/2 + heightSizeUnity*7), size: CGSize(width: widthSizeUnity*0.5, height: widthSizeUnity*0.5*1.91), associatedCartesianPoint: "(5,7)")
        
        let bigIslandPart1 = MapObstacle(textureName: "BigIsland1", position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*8 - 2, y: -oceanTexture.size.height/2 + heightSizeUnity*10 - 3), size: CGSize(width: widthSizeUnity*1.7, height: widthSizeUnity*1.5), associatedCartesianPoint: "(8,10)")
        
        let bigIslandPart2 = MapObstacle(textureName: "BigIsland2", position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*8 - 2, y: -oceanTexture.size.height/2 + heightSizeUnity*11 + 4), size: CGSize(width: widthSizeUnity*1.7, height: widthSizeUnity*1.5*0.76), associatedCartesianPoint: "(8,11)")
        
        let bigIslandPart3 = MapObstacle(textureName: "BigIsland3", position: CGPoint(x: (-oceanTexture.size.width/2 + (widthSizeUnity*9)) + 5, y: (-oceanTexture.size.height/2 + (heightSizeUnity*10)) - 3), size: CGSize(width: widthSizeUnity, height: widthSizeUnity*1.5), associatedCartesianPoint: "(9,10)")
        
        let bigIslandPart4 = MapObstacle(textureName: "BigIsland4", position: CGPoint(x: (-oceanTexture.size.width/2 + (widthSizeUnity*10) ) + -12, y: -oceanTexture.size.height/2 + heightSizeUnity*11 + 6), size: CGSize(width: widthSizeUnity*1.5, height: widthSizeUnity*1.5*0.67), associatedCartesianPoint: "(9,11)")

        //greenShip.zRotation = CGFloat.pi/4
        
        let mapObstaclesArray = [smallIsland, mediumIsland, rock, greenShip, bigIslandPart1, bigIslandPart2, bigIslandPart3, bigIslandPart4]

        return mapObstaclesArray
    }
    
    func addElementOnScreen(elementName: SKSpriteNode, elementZPosition: CGFloat, elementSize: CGSize, elementAnchorPoint: CGPoint, elementPosition: CGPoint) {
        
        elementName.zPosition = elementZPosition
        elementName.size = elementSize
        elementName.position = elementPosition
        elementName.anchorPoint = elementAnchorPoint
        
        return addChild(elementName)
        
    }
    
    func createGrid(container: SKNode) {
        
        let gridWidth = oceanTexture.size.width
        let gridHeight = oceanTexture.size.height
        let gridPosition = oceanTexture.position
        
        let numRows = 12
        let numCols = 11
        
        let cellSize = CGSize(width: gridWidth/CGFloat(numCols) + 1, height: gridHeight/CGFloat(numRows) + 1)
       
        for row in 0..<numRows {
                    for col in 0..<numCols {
                        var textureName = "Tile"
                        if (row == 0 && col == 0){
                            textureName = "TileCornerLowerLeft"
                        } else if row == 11 && col == 0 {
                            textureName = "TileCornerUpperLeft"
                        } else if row == 0 && col == 10 {
                            textureName = "TileCornerLowerRight"
                        } else if row == 11 && col == 10 {
                            textureName = "TileCornerUpperRight"
                        } else if row == 0 {
                            textureName = "TileLowerSide"
                        } else if row == 11 {
                            textureName = "TileUpperSide"
                        } else if col == 0 {
                            textureName = "TileLeftSide"
                        } else if col == 10 {
                            textureName = "TileRightSide"
                        }
                        
                        let texture = SKTexture(imageNamed: textureName)
                        
                        let tile = SKSpriteNode(texture: texture, size: cellSize)
                        
                        let tileX = gridPosition.x - gridWidth/2 + CGFloat(col) * (cellSize.width - 1)
                        let tileY = gridPosition.y - gridHeight/2 + CGFloat(row) * (cellSize.height - 1)
                             
                        tile.position = CGPoint(x: tileX + cellSize.width/2, y: tileY + cellSize.height/2)
                        
                        container.addChild(tile)
                    }
                }
        }
    
    func navigateToNextLevel() {
        if let view = self.view {
            let nextScene = ScreenPlayable2(size: self.size)
            nextScene.scaleMode = self.scaleMode
            view.presentScene(nextScene, transition: SKTransition.fade(withDuration: 0.5))
        }
    }
   
}
    


