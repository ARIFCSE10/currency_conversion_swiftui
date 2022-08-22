//
//  Currency.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 21/8/22.
//

import Foundation
struct Currency{
    var rate:Double?
    let code:String
    let name:String
}

extension Currency{
    static let mock:[Currency] = [
        Currency(rate: 1, code: "USD", name: "US Dollar"),
        Currency(rate: 95, code: "BST", name: "Bangladeshi Taka")
    ]
}
