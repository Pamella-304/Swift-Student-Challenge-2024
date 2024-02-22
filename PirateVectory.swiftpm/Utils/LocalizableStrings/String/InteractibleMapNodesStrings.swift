
enum InteractibleMapNodesStrings: String {
    
    
    
    case redCircle = "redCircle"
    
    case oceanTexture = "FundoMar"
    
    case verticalAxe = "VerticalAxe"
    case horizontalAxe = "HorizontalAxe"
    
    case yIndice = "redY"
    case xIndice = "yellowX"
    
    case verticalIndice0 = "red0"
    case verticalIndice1 = "red1"
    case verticalIndice2 = "red2"
    case verticalIndice3 = "red3"
    case verticalIndice4 = "red4"
    case verticalIndice5 = "red5"
    case verticalIndice6 = "red6"
    case verticalIndice7 = "red7"
    case verticalIndice8 = "red8"
    case verticalIndice9 = "red9"
    case verticalIndice10 = "red10"
    case verticalIndice11 = "red11"
    
    case horizontalIndice0 = "yellow0"
    case horizontalIndice1 = "yellow1"
    case horizontalIndice2 = "yellow2"
    case horizontalIndice3 = "yellow3"
    case horizontalIndice4 = "yellow4"
    case horizontalIndice5 = "yellow5"
    case horizontalIndice6 = "yellow6"
    case horizontalIndice7 = "yellow7"
    case horizontalIndice8 = "yellow8"
    case horizontalIndice9 = "yellow9"
    case horizontalIndice10 = "yellow10"
    case horizontalIndice11 = "yellow11"
    
    case Tile = "Tile"
    case TileCornerLowerLeft = "TileCornerLowerLeft"
    case TileCornerUpperLeft = "TileCornerUpperLeft"
    case TileCornerLowerRight = "TileCornerLowerRight"
    case TileCornerUpperRight = "TileCornerUpperRight"
    case TileLowerSide = "TileLowerSide"
    case TileUpperSide = "TileUpperSide"
    case TileLeftSide = "TileLeftSide"
    case TileRightSide = "TileRightSide"

    
    case pirateShip = "PirateShip"
    case pirateShipPosition = "(0,0)"
    
    case smallIsland = "SmallIsland"
    case smallIslandPosition = "(2,3)"
    
    case mediumIsland = "MediumIsland"
    case mediumIslandPosition = "(7,3)"
    
    case rock = "Rock"
    case rockPosition = "(9,6)"
    
    case greenShip = "GreenShip"
    case greenShipPosition = "(5,7)"
    
    case bigIslandLowerLeft = "BigIsland_LowerLeft"
    case bigIslandLowerLeftPosition = (8,10)"
    
    case bigIslandUpperLeft = "BigIsland_UpperLeft"
    case bigIslandUpperLeftPosition = "(8,11)"
    
    case bigIslandLowerRight = "BigIsland_LowerRight"
    case bigIslandLowerRightPosition = "(9,10)"
    
    case bigIslandUpperRight = "BigIsland_UpperRight"
    case bigIslandUpperRightPosition = "(9,11)"
    
    func localized() -> String {rawValue.localized(.Screen1Strings)}
    
}
