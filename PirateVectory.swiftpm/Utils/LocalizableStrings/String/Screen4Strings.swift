//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 31/01/24.
//


enum Screen4Strings: String {
    case Label1 = "Have you ever played battleship? It`s (almost) the same process"
    case Label2 = "You have to identify the points using the references"
    
    func localized() -> String {rawValue.localized(.Screen1Strings)}
    
}
