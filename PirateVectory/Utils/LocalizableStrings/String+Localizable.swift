//
//  File.swift
//
//
//  Created by Pamella Alvarenga on 31/01/24.
//

import Foundation

extension String {
    func localized(_ screen: ScreenChoice) -> String {
        
        var fileName = String()
        
        switch screen {
            
        case .InteractibleMapNodesStrings:
            fileName = "InteractibleMapNodesStrings"
            
        case .Screen1Strings:
            fileName = "Screen1Strings"
            
        case .Screen2Strings:
            fileName = "Screen2Strings"
            
        case .Screen3Strings:
            fileName = "Screen3Strings"
            
        case .Screen4Strings:
            fileName = "Screen4Strings"
            
        case .Screen5Strings:
            fileName = "Screen5Strings"
            
            
        case .Level1Strings:
            fileName = "Level1Strings"
            
        case .Level2Strings:
            fileName = "Level2Strings"
            
            
        case .Screen6Strings:
            fileName = "Screen6Strings"
            
        case .Screen7Strings:
            fileName = "Screen7Strings"
            
        case .Screen8Strings:
            fileName = "Screen8Strings"
            
        case .Screen9Strings:
            fileName = "Screen9Strings"
            
        case .Screen10Strings:
            fileName = "Screen10Strings"
            
        case .Screen11Strings:
            fileName = "Screen11Strings"
            
        case .Screen12Strings:
            fileName = "Screen12Strings"
            
            
            
        case .ScreenPreFinalStrings:
            fileName = "ScreenPreFinalStrings"
            
        case .ScreenFinalStrings:
            fileName = "ScreenFinalStrings"
            
     
        }
        return NSLocalizedString(self, tableName: fileName, bundle: Bundle.main, value: String(), comment: String())
        
        
    }
}
