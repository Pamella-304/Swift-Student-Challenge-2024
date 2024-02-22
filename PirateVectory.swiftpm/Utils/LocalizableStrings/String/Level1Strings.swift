
enum Level1Strings: String {
    case backgroundTexture = "BackgroundMapTexture"
        
    func localized() -> String {rawValue.localized(.Level1Strings)}
    
}
