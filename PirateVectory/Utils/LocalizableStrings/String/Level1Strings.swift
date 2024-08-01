
enum Level1Strings: String {
    case backgroundTexture = "BackgroundMapTexture"
        
    case RockCartesianPoint = "(9,6)"
    
    case SmallIslandCartesianPoint = "(2,3)"
    
    case MediumIslandCartesianPoint = "(7,3)"
    
    case GreenShipCartesianPoint = "(5,7)"
    
    case BigIslandLowerLeftCartesianPoint = "(8,10)"
    
    case BigIslandUpperLeftCartesianPoint = "(8,11)"
    
    case BigIslandLowerRightCartesianPoint = "(9,10)"
    
    case BigIslandUpperRightCartesianPoint = "(9,11)"
    
    
    func localized() -> String {rawValue.localized(.Level1Strings)}
    
}

