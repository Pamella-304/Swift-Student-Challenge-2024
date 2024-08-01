//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 16/02/24.
//

enum ScreenFinalStrings: String {
    
    case Label1 = "And now you`re offically part of our crew! Welcome abord!"
    
    case Label2 = "But have your ever considered going to maths or physics too? I think you may have the gift for that!"
    
    func localized() -> String {rawValue.localized(.ScreenFinalStrings)}
    
}
