//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 25/02/24.
//

import UIKit
import SpriteKit

class TryAgainPopUp: SKNode {
    
    var backgroundTexture = SKSpriteNode(imageNamed: Level1Strings.backgroundTexture.rawValue)

    
    override init() {
           super.init()
           createBlackBackground()
       }

       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

    
    
    
       private func createBlackBackground() {
           let size = CGSize(width: screenHeight*0.5, height: screenHeight*0.5)
           let Node = SKSpriteNode(color: UIColor(red: 250.0/255.0, green: 228.0/255.0, blue: 167.0/255.0, alpha: 1.0), size: size)
           Node.zPosition = -1 // Coloca o fundo atrás de outros nós
           Node.alpha = 1.0
           Node.position = CGPoint(x: 0, y: 0)
           //Node.position = CGPoint(x: 0, y: screenHeight*0.167)
           addChild(Node)
           
           backgroundTexture.size = CGSize(width: Node.size.width, height: Node.size.height)
           backgroundTexture.anchorPoint = CGPoint(x: 0.5, y: 0.5)
           backgroundTexture.position = CGPoint(x: 0, y: 0)
           backgroundTexture.zPosition = 1
           
           Node.addChild(backgroundTexture)

           
           let labelText1 = "Ooops!"
           let label1 = SKLabelNode(text: labelText1)
               label1.fontName = "LuckiestGuy-Regular"
               label1.fontSize = 45.0
           label1.numberOfLines = 0
               label1.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
           label1.position = CGPoint(x: 0, y: Node.size.height/4)
           label1.preferredMaxLayoutWidth = screenHeight*0.4
              label1.horizontalAlignmentMode = .center
              label1.verticalAlignmentMode = .center
            label1.zPosition = 2
               Node.addChild(label1)
           
           let labelText2 = "It wasn`t this time..."
           let label2 = SKLabelNode(text: labelText2)
               label2.fontName = "LuckiestGuy-Regular"
               label2.fontSize = 45.0
               label2.numberOfLines = 0
               label2.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
               label2.position = CGPoint(x: 0, y: 0)
               label2.preferredMaxLayoutWidth = screenHeight*0.45
               label2.horizontalAlignmentMode = .center
               label2.verticalAlignmentMode = .center
           label2.zPosition = 2

               Node.addChild(label2)
           
           let labelText3 = "Tap to try again!"
           let label3 = SKLabelNode(text: labelText3)
               label3.fontName = "LuckiestGuy-Regular"
               label3.fontSize = 45.0
               label3.numberOfLines = 0
               label3.fontColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
               label3.position = CGPoint(x: 0, y: -Node.size.height/4)
               label3.preferredMaxLayoutWidth = screenHeight*0.45
               label3.horizontalAlignmentMode = .center
               label3.verticalAlignmentMode = .center
           label3.zPosition = 2

               Node.addChild(label3)
           
           
           
           
           let border = SKShapeNode(rect: CGRect(origin: CGPoint(x: -Node.size.width/2, y: -Node.size.height/2 ), size: size))
           border.strokeColor = UIColor(red: 74.0/255.0, green: 54.0/255.0, blue: 47.0/255.0, alpha: 1.0)
           border.lineWidth = 5.0 // Ajuste conforme necessário

            addChild(border)
           
       }
    
}
