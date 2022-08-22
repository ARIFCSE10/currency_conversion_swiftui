//
//  Currency.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 21/8/22.
//

import Foundation

struct Currency : Codable {
    var rate:Double?
    let code:String
    let name:String
}

extension Currency{
    static let mock:[Currency] = [
        Currency(rate: 1, code: "USD", name: "United States Dollar"),
        Currency(rate: 95, code: "BDT", name: "Bangladeshi Taka")
    ]
    
    static let base:Currency = Currency(rate: 1, code: "USD", name: "United States Dollar")
    static let second:Currency = Currency(rate: 95, code: "BDT", name: "Bangladeshi Taka")
    static let third:Currency = Currency(rate: 135, code: "JPY", name: "Japanese Yen")

}
