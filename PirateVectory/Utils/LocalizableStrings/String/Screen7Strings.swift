//
//  File.swift
//
//
//  Created by Pamella Alvarenga on 21/02/24.
//

enum Screen7Strings: String {
    case Label1 = "The shortest path to our treasure island would be a straight line "
    case Label2 = "This is what we call a ( 8, 10 ) vector, but we can`t use it because of the obstacles"
    
    func localized() -> String {rawValue.localized(.Screen7Strings)}
    
}
