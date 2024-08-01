import SpriteKit

class CartesianPointImage: SKNode{
    
    var imageName: String
    var wasTouched: Bool
    let imageNodeWidth: CGFloat
    let associatedXValue: Double?
    let associatedYValue: Double?
    
    init(imageName: String, anchorPoint: CGPoint, position: CGPoint, imageNodeWidth: CGFloat, associatedXValue: Double?, associatedYValue: Double?) {
        
        self.associatedXValue = associatedXValue
        self.associatedYValue = associatedYValue
        self.imageName = imageName
        self.imageNodeWidth = imageNodeWidth
        self.wasTouched = false
        super.init()
        
        self.alpha = 1.0
        
        let imageCartesianPoint = SKSpriteNode(imageNamed: imageName)
        imageCartesianPoint.anchorPoint = anchorPoint
        imageCartesianPoint.position = position
        imageCartesianPoint.anchorPoint = anchorPoint
        imageCartesianPoint.size = CGSize(width: imageNodeWidth, height: (0.4 * imageNodeWidth))
        zPosition = 2
        
        addChild(imageCartesianPoint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toggleVisibility() {
        
        wasTouched = !wasTouched
        
        if wasTouched {
            self.alpha = 0.5
        } else {
            self.alpha = 1.0
        }
    }
}



