//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 19/02/24.
//

import SpriteKit

class InteractibleMap: SKNode {
    
    var oceanTexture = SKSpriteNode(imageNamed: "FundoMar")
    var backgroundTexture = SKSpriteNode(imageNamed: "BackgroundMapTexture")
    var verticalAxe = SKSpriteNode(imageNamed: "VerticalAxe")
    var horizontalAxe = SKSpriteNode(imageNamed: "HorizontalAxe")
    var pirateShip = SKSpriteNode(imageNamed: "PirateShip")
    let Grid = SKNode()
    var mapObstaclesArray: [SKNode] = []
    var verticalIndices: [SKSpriteNode] = [SKSpriteNode(imageNamed: "red0"), SKSpriteNode(imageNamed: "red1"), SKSpriteNode(imageNamed: "red2"), SKSpriteNode(imageNamed: "red3"), SKSpriteNode(imageNamed: "red4"), SKSpriteNode(imageNamed: "red5"), SKSpriteNode(imageNamed: "red6"), SKSpriteNode(imageNamed: "red7"), SKSpriteNode(imageNamed: "red8"), SKSpriteNode(imageNamed: "red9"), SKSpriteNode(imageNamed: "red10"), SKSpriteNode(imageNamed: "red11")]
    
    var horizontalIndices: [SKSpriteNode] = [SKSpriteNode(imageNamed: "yellow0"), SKSpriteNode(imageNamed: "yellow1"), SKSpriteNode(imageNamed: "yellow2"), SKSpriteNode(imageNamed: "yellow3"), SKSpriteNode(imageNamed: "yellow4"), SKSpriteNode(imageNamed: "yellow5"), SKSpriteNode(imageNamed: "yellow6"), SKSpriteNode(imageNamed: "yellow7"), SKSpriteNode(imageNamed: "yellow8"), SKSpriteNode(imageNamed: "yellow9"), SKSpriteNode(imageNamed: "yellow10"), SKSpriteNode(imageNamed: "yellow11")]
    
    
    var size: CGSize = .zero
        
    func sceneDidLoad() {
        
        self.size = myScreenSize
        
        
        self.scene?.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        let oceanTextureWidth = 0.85 * screenWidth
        let oceanTextureHeight = 0.92 * oceanTextureWidth
        
        
        addElementOnScreen(elementName: backgroundTexture, elementZPosition: 1, elementSize: CGSize(width: self.size.width, height: self.size.height), elementAnchorPoint: CGPoint(x: 0.5, y: 0.5), elementPosition: CGPoint(x: 0, y: 0))
        
        addElementOnScreen(elementName: oceanTexture, elementZPosition: 2, elementSize: CGSize(width: oceanTextureWidth, height: oceanTextureHeight), elementAnchorPoint: CGPoint(x: 0.5, y: 0.5), elementPosition: CGPoint(x: 0, y: self.size.height/2 - (oceanTextureHeight/2 + verticalSpacing)))
        
        addElementOnScreen(elementName: horizontalAxe, elementZPosition: 4, elementSize: CGSize(width: oceanTexture.size.width*1.05, height: oceanTexture.size.width*0.05), elementAnchorPoint: CGPoint(x: 0, y: 0.5), elementPosition: CGPoint(x: oceanTexture.anchorPoint.x * (1 - oceanTexture.size.width), y: oceanTexture.position.y - oceanTexture.size.height/2 + 1))
        
        addElementOnScreen(elementName: verticalAxe, elementZPosition: 4, elementSize: CGSize(width: oceanTexture.size.width*0.05, height: oceanTexture.size.height*1.05), elementAnchorPoint: CGPoint(x: 0.5, y: 0), elementPosition: CGPoint(x: oceanTexture.anchorPoint.x * (1 - oceanTexture.size.width), y: oceanTexture.position.y-oceanTexture.size.height/2))
        
        addElementOnScreen(elementName: pirateShip, elementZPosition: 5, elementSize: CGSize(width: oceanTextureWidth*0.07, height: oceanTextureWidth*0.07 * 1.7), elementAnchorPoint: CGPoint(x: 0.5, y: 0.5), elementPosition: CGPoint(x: oceanTexture.anchorPoint.x * (1 - oceanTexture.size.width) , y: oceanTexture.position.y - oceanTexture.size.height/2 + 1))
        
        addCartesianIndices()
        
        pirateShip.zRotation = -CGFloat.pi / 4
        
        createGrid(container: Grid)
        Grid.zPosition = 3
        addChild(Grid)
        
        mapObstaclesArray = createMapObstaclesArray()
        
        for obstacle in mapObstaclesArray {
            oceanTexture.addChild(obstacle)

        }
        
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
        
        let smallIsland = MapObstacle(textureName: SKTexture(imageNamed: "SmallIsland"), position: CGPoint(x:-oceanTexture.size.width/2 + widthSizeUnity*2, y:-oceanTexture.size.height/2 + heightSizeUnity*3), color: .clear, size: CGSize(width: widthSizeUnity, height: widthSizeUnity*1.05), associatedCartesianPoint: "(2,3)")
     
        let mediumIsland = MapObstacle(textureName: SKTexture(imageNamed: "MediumIsland"), position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*7, y: -oceanTexture.size.height/2 + heightSizeUnity*3), color: .clear, size: CGSize(width: widthSizeUnity*1.6, height: widthSizeUnity*1.6*0.93), associatedCartesianPoint: "(7,3)")
        
        let rock = MapObstacle(textureName: SKTexture(imageNamed: "Rock"), position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*9, y: -oceanTexture.size.height/2 + heightSizeUnity * 6), color: .clear, size: CGSize(width: widthSizeUnity*1.2, height: widthSizeUnity*1.2*0.78), associatedCartesianPoint: "(9,6)")
        
        let greenShip = MapObstacle(textureName: SKTexture(imageNamed: "GreenShip"), position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*5, y: -oceanTexture.size.height/2 + heightSizeUnity * 7 ), color: .clear, size: CGSize(width: widthSizeUnity*0.5, height: widthSizeUnity*0.5*1.91), associatedCartesianPoint: "(5,7)")
        
        let bigIslandPart_LowerLeft = MapObstacle(textureName: SKTexture(imageNamed: "BigIsland_LowerLeft"), position: CGPoint(x: -oceanTexture.size.width/2 + (widthSizeUnity * 7.9), y: -oceanTexture.size.height/2 + (heightSizeUnity * 10) ), color: .clear, size: CGSize(width: widthSizeUnity*1.3, height: heightSizeUnity * 1.4), associatedCartesianPoint: "(8,10)")
        //
        let bigIslandPart_UpperLeft = MapObstacle(textureName: SKTexture(imageNamed: "BigIsland_UpperLeft"), position: CGPoint(x: -oceanTexture.size.width/2 + (widthSizeUnity*7.9) , y: -oceanTexture.size.height/2 + (heightSizeUnity*11.22)), color: .clear, size: CGSize(width: widthSizeUnity*1.3, height: heightSizeUnity*1.4), associatedCartesianPoint: "(8,11)")
        //
        let bigIslandPart_LowerRight = MapObstacle(textureName: SKTexture(imageNamed: "BigIsland_LowerRight"), position: CGPoint(x: (-oceanTexture.size.width/2 + (widthSizeUnity*8.94) ), y: (-oceanTexture.size.height/2 + (heightSizeUnity*10))), color: .clear, size: CGSize(width: widthSizeUnity*0.8, height: heightSizeUnity*1.4), associatedCartesianPoint: "(10,9)")
        
        let bigIslandPart_UpperRight = MapObstacle(textureName: SKTexture(imageNamed: "BigIsland_UpperRight"), position: CGPoint(x: (-oceanTexture.size.width/2 + (widthSizeUnity*9.14)), y: -oceanTexture.size.height/2 +  (heightSizeUnity*11.31)), color: .clear, size: CGSize(width: widthSizeUnity*1.2, height:heightSizeUnity*1.25), associatedCartesianPoint: "(9,11)")
        
        let mapObstaclesArray = [smallIsland, mediumIsland, rock, greenShip, bigIslandPart_LowerLeft, bigIslandPart_UpperLeft, bigIslandPart_LowerRight, bigIslandPart_UpperRight]

        return mapObstaclesArray
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
    
   
    
}
