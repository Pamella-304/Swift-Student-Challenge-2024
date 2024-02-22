
enum Level2Strings: String {
  
    case namehere
    
    func localized() -> String {rawValue.localized(.Level1Strings)}
    
}
