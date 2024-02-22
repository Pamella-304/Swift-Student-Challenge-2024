//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 21/02/24.
//


enum Screen11Strings: String {
    case Label1 = "This is a (9,8) resultant"
    case Label2 = "This is a (2,5) vector"
    case Label3 = "And This is a (7,3) vector"

    
    func localized() -> String {rawValue.localized(.Screen11Strings)}
    
}
