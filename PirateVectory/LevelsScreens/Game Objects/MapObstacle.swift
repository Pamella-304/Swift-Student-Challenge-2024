//Essa classe define os objetos no mapa que, inicialmente, terão alpha 0 mas que, ao serem tocados pelo usuário, passarão a ter alpha 1.

import SpriteKit

class MapObstacle: SKSpriteNode {
    
    var isVisible: Bool
    var isInteractible: Bool
    var associatedCartesianPoint: String // Associa ao ponto cartesiano correspondente, na parte inferior da tela do jogo

    init(textureName: SKTexture?, position: CGPoint, color: UIColor, size: CGSize, associatedCartesianPoint: String) {
        
        self.associatedCartesianPoint = associatedCartesianPoint
        self.isVisible = false
        self.isInteractible = true
        
        super.init(texture: textureName, color: color, size: size)
        
        self.position = position
        self.zPosition = 3
        self.alpha = 0
        
        self.isUserInteractionEnabled = false

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Função para alternar a visibilidade do obstáculo e da imagem associada
    
    func toggleVisibility() {
        isVisible = !isVisible
        
        if isVisible {
            self.alpha = 1.0
        } else {
            self.alpha = 0.0
        }
        
        isInteractible = false
    }
}

