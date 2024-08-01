//
//  File.swift
//
//
//  Created by Pamella Alvarenga on 21/02/24.
//

import Foundation

enum Screen10Strings: String {
    case Label1 = "This is a (9,8) resultant"
    case Label2 = "This is a (2,5) vector"
    
    func localized() -> String {rawValue.localized(.Screen10Strings)}
    
}

