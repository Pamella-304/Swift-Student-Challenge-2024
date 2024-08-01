//
//  File.swift
//
//
//  Created by Pamella Alvarenga on 31/01/24.
//


enum Screen3Strings: String {
    case Label1 = "I`ve never been very good at math  at school... So, reading it isn`t exactly my best hability"
    case Label2 = "but I know you can help me with that job"
    
    func localized() -> String {rawValue.localized(.Screen3Strings)}
    
}
