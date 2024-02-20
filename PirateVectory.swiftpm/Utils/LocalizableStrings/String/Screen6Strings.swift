//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 20/02/24.
//
enum Screen6Strings: String {
    case Label1 = "We did it! We found the treasure!"
    case Label2 = "wow! You`re very good at it! I wouldn`t have done without your help!"
    
    func localized() -> String {rawValue.localized(.Screen1Strings)}
    
}
