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
        
        switch screen{
            
        case .Screen1Strings:
            fileName = "Screen1Strings"
            
        case .Screen2Strings:
            fileName = "Screen2Strings"
            
        case .Screen3Strings:
            fileName = "Screen3Strings"
            
        case .ScreenPlayable1Strings:
            fileName = "ScreenPlayable1Strings"
            
        case .ScreenPlayable2Strings:
            fileName = "ScreenPlayable2Strings"
            
            
        }
        return NSLocalizedString(self, tableName: fileName, bundle: Bundle.main, value: String(), comment: String())
        
        
    }
}
