//
//  File.swift
//  
//
//  Created by Pamella Alvarenga on 31/01/24.
//


enum Screen1Strings: String {
    case Label1 = "Hello! I`m Captain vectory and I have a mission"
    case Label2 = "to find a treasure hidden by an ancient pirate  in a secret island"
    
    func localized() -> String {rawValue.localized(.Screen1Strings)}
    
}
