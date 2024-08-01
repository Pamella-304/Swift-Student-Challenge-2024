//
//  FontManager.swift
//  PirateVectory
//
//  Created by Pamella Alvarenga on 29/01/24.
//

import SwiftUI

class FontManager {
    static func getFont(size: Double) -> Font{
        if let cfURL = Bundle.main.url(forResource: "LuckiestGuy-Regular", withExtension: "ttf") {
            CTFontManagerRegisterFontsForURL(cfURL as CFURL, CTFontManagerScope.process, nil)
        }
        let uiFont = UIFont(name: "LuckiestGuy-Regular", size: size)
        return Font(uiFont ?? UIFont())
    }
}
