//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 31/01/24.
//


enum Screen2Strings: String {
    case Label1 = "I already have the map to the island, But  This ancient pirate was a physicist"
    case Label2 = "and he drew the map using cartesian coordinates and vectors"
    
    func localized() -> String {rawValue.localized(.Screen1Strings)}
    
}
