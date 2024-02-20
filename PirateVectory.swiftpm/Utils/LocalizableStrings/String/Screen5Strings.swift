//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 31/01/24.
//


enum Screen5Strings: String {
    case Label1 = "Look at this battleship map! The points at the map are represented like this"
    case Label2 = "This means our ship is at point:"
    
    func localized() -> String {rawValue.localized(.Screen1Strings)}
    
}
