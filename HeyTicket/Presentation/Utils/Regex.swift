//
//  Regex.swift
//  HeyTicket
//
//  Created by 박소윤 on 2023/06/22.
//

import Foundation

struct Regex{
    
    enum RegexType: String{
        case password = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,50}"
    }
    
    static func evaluate(expression: RegexType, target: String) -> Bool{
        return NSPredicate(format:"SELF MATCHES %@", expression.rawValue).evaluate(with: target)
    }
}
