//Essa classe define os objetos no mapa que, inicialmente, terão alpha 0 mas que, ao serem tocados pelo usuário, passarão a ter alpha 1.

import SpriteKit

class MapObstacle: SKNode {
    
    var textureName: String
    var isVisible: Bool
    var isInteractible: Bool
    var associatedCartesianPoint: String // Associa ao ponto cartesiano correspondente, na parte inferior da tela do jogo
    
    
    init(textureName: String, position: CGPoint, size: CGSize, associatedCartesianPoint: String) {
        self.associatedCartesianPoint = associatedCartesianPoint
        self.textureName = textureName
        self.isVisible = false
        self.isInteractible = true
        super.init()
        
        self.alpha = 0

        //criar o node do obstáculo
        let mapObstacle = SKSpriteNode(imageNamed: textureName)
        mapObstacle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mapObstacle.position = position
        mapObstacle.size = size
        zPosition = 3
        
        addChild(mapObstacle)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // Função para alternar a visibilidade do obstáculo e da imagem associated
    
    func toggleVisibility() {
        isVisible = !isVisible
        
        if isVisible {
            self.alpha = 1.0
        } else {
            self.alpha = 0.5
        }
        
        isInteractible = false
    }
}
