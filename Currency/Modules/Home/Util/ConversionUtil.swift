//
//  ConversionUtil.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 22/8/22.
//

import Foundation

struct ConversionUtil{
    static func convert(fromCurrency:Currency, amount:Double, toCurrency:Currency) -> Double {
        if(fromCurrency.code == "USD"){
            return amount * (toCurrency.rate ?? 0)
        }
        return convert(fromCurrency: Currency.base, amount:  amount / (fromCurrency.rate ?? 1), toCurrency: toCurrency)
    }
}
