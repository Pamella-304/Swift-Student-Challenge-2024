//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 19/02/24.
//

import SpriteKit

class InteractibleMap: SKScene {
    
    var oceanTexture = SKSpriteNode(imageNamed: "FundoMar")
    var backgroundTexture = SKSpriteNode(imageNamed: "BackgroundMapTexture")
    var verticalAxe = SKSpriteNode(imageNamed: "VerticalAxe")
    var horizontalAxe = SKSpriteNode(imageNamed: "HorizontalAxe")
    var pirateShip = SKSpriteNode(imageNamed: "PirateShip")
    let Grid = SKNode()
    var mapObstaclesArray: [SKNode] = []
        
    override func sceneDidLoad() {
        
        self.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        let verticalSpacing = UIScreen.main.bounds.height * 0.065
        let oceanTextureWidth = 0.85 * UIScreen.main.bounds.width
        let oceanTextureHeight = 0.92 * oceanTextureWidth
        
        addElementOnScreen(elementName: backgroundTexture, elementZPosition: 1, elementSize: CGSize(width: self.size.width, height: self.size.height), elementAnchorPoint: CGPoint(x: 0.5, y: 0.5), elementPosition: CGPoint(x: 0, y: 0))
        
        addElementOnScreen(elementName: oceanTexture, elementZPosition: 2, elementSize: CGSize(width: oceanTextureWidth, height: oceanTextureHeight), elementAnchorPoint: CGPoint(x: 0.5, y: 0.5), elementPosition: CGPoint(x: 0, y: self.size.height/2 - (oceanTextureHeight/2 + verticalSpacing)))
        
        addElementOnScreen(elementName: horizontalAxe, elementZPosition: 4, elementSize: CGSize(width: oceanTexture.size.width*1.05, height: oceanTexture.size.width*0.05), elementAnchorPoint: CGPoint(x: 0, y: 0.5), elementPosition: CGPoint(x: oceanTexture.anchorPoint.x * (1 - oceanTexture.size.width), y: oceanTexture.position.y - oceanTexture.size.height/2 + 1))
        
        addElementOnScreen(elementName: verticalAxe, elementZPosition: 4, elementSize: CGSize(width: oceanTexture.size.width*0.05, height: oceanTexture.size.height*1.05), elementAnchorPoint: CGPoint(x: 0.5, y: 0), elementPosition: CGPoint(x: oceanTexture.anchorPoint.x * (1 - oceanTexture.size.width), y: oceanTexture.position.y-oceanTexture.size.height/2))
        
        addElementOnScreen(elementName: pirateShip, elementZPosition: 5, elementSize: CGSize(width: oceanTextureWidth*0.07, height: oceanTextureWidth*0.07 * 1.7), elementAnchorPoint: CGPoint(x: 0.5, y: 0.5), elementPosition: CGPoint(x: oceanTexture.anchorPoint.x * (1 - oceanTexture.size.width) , y: oceanTexture.position.y - oceanTexture.size.height/2 + 1))
        
        pirateShip.zRotation = -CGFloat.pi / 4
        
        createGrid(container: Grid)
        Grid.zPosition = 3
        addChild(Grid)
        
        mapObstaclesArray = createMapObstaclesArray()
        
        for obstacle in mapObstaclesArray {
            oceanTexture.addChild(obstacle)
            
            if oceanTexture.contains(obstacle) {
                print("Contem")
            }

        }
        
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
        
        let smallIsland = MapObstacle(textureName: SKTexture(imageNamed: "SmallIsland"), position: CGPoint(x:/*-oceanTexture.size.width/2 + widthSizeUnity*2*/ 0, y:/*-oceanTexture.size.height/2 + heightSizeUnity*3*/ 0), color: .clear, size: CGSize(width: widthSizeUnity, height: widthSizeUnity*1.05), associatedCartesianPoint: "(2,3)")
                                
//        let mediumIsland = MapObstacle(textureName: "MediumIsland", position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*7, y: -oceanTexture.size.height/2 + heightSizeUnity*3), size: CGSize(width: widthSizeUnity*1.8, height: widthSizeUnity*1.8*0.93), associatedCartesianPoint: "(7,3)")
//        
//        let rock = MapObstacle(textureName: "Rock", position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*9, y: -oceanTexture.size.height/2 + heightSizeUnity * 6), size: CGSize(width: widthSizeUnity*1.2, height: widthSizeUnity*1.2*0.78), associatedCartesianPoint: "(9,6)")
//        
//        //-oceanTexture.size.width/2 + widthSizeUnity*5
//        //-oceanTexture.size.height/2
//        
//        let greenShip = MapObstacle(textureName: "GreenShip", position: CGPoint(x: 0, y: 0 ), size: CGSize(width: widthSizeUnity*0.5, height: widthSizeUnity*0.5*1.91), associatedCartesianPoint: "(5,7)")
//        
//        let bigIslandPart1 = MapObstacle(textureName: "BigIsland1", position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity * 8 - 2, y: -oceanTexture.size.height/2 + heightSizeUnity * 10 - 3), size: CGSize(width: widthSizeUnity*1.7, height: widthSizeUnity * 1.5), associatedCartesianPoint: "(8,10)")
//        
//        let bigIslandPart2 = MapObstacle(textureName: "BigIsland2", position: CGPoint(x: -oceanTexture.size.width/2 + widthSizeUnity*8 - 2, y: -oceanTexture.size.height/2 + heightSizeUnity*11 + 4), size: CGSize(width: widthSizeUnity*1.7, height: widthSizeUnity*1.5*0.76), associatedCartesianPoint: "(8,11)")
//        
//        let bigIslandPart3 = MapObstacle(textureName: "BigIsland3", position: CGPoint(x: (-oceanTexture.size.width/2 + (widthSizeUnity*9)) + 5, y: (-oceanTexture.size.height/2 + (heightSizeUnity*10)) - 3), size: CGSize(width: widthSizeUnity, height: widthSizeUnity*1.5), associatedCartesianPoint: "(9,10)")
//        
//        let bigIslandPart4 = MapObstacle(textureName: "BigIsland4", position: CGPoint(x: (-oceanTexture.size.width/2 + (widthSizeUnity*10) ) + -12, y: -oceanTexture.size.height/2 + heightSizeUnity*11 + 6), size: CGSize(width: widthSizeUnity*1.5, height: widthSizeUnity*1.5*0.67), associatedCartesianPoint: "(9,11)")
//
//        //greenShip.zRotation = CGFloat.pi/4
//        
        let mapObstaclesArray = [smallIsland]

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
