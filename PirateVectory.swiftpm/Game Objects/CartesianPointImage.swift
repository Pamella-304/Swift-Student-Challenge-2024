//
//  CartesianPointImage.swift
//  PirateVectory
//
//  Created by Pamella Alvarenga on 07/02/24.
//

import SpriteKit

class CartesianPointImage: SKNode{
    
    var imageName: String
    var isVisible: Bool
    let imageNodeWidth: CGFloat
    
    init(imageName: String, anchorPoint: CGPoint, position: CGPoint, imageNodeWidth: CGFloat) {
        self.imageName = imageName
        self.imageNodeWidth = imageNodeWidth        
        self.isVisible = true
        super.init()
        
        self.alpha = 1.0
        
        let imageCartesianPoint = SKSpriteNode(imageNamed: imageName)
        imageCartesianPoint.anchorPoint = anchorPoint
        imageCartesianPoint.position = position
        imageCartesianPoint.anchorPoint = anchorPoint
        imageCartesianPoint.size = CGSize(width: imageNodeWidth, height: (0.33 * imageNodeWidth))
        zPosition = 2
        
        addChild(imageCartesianPoint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toggleVisibility() {
        isVisible = !isVisible
        
        if isVisible {
            self.alpha = 1.0
        } else {
            self.alpha = 0.5
        }
    }
}


