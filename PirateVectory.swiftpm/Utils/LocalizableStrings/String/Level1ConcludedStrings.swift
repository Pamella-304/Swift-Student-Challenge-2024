//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 21/02/24.
//

enum Level1ConcludedStrings: String {
    case Label = "Perfect! Now we understand the whole map and can finally move on with the journey"
    
    func localized() -> String {rawValue.localized(.Screen1Strings)}
    
}
