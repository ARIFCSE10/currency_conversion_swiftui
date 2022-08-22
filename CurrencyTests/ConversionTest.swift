//
//  ConversionTest.swift
//  CurrencyTests
//
//  Created by Mohammed Badsha Alamgir on 22/8/22.
//

import XCTest

class ConversionTest: XCTestCase {
    func testBaseToSecondConversion() throws {
        let base = Currency.base
        let second = Currency.second
        let amount:Double = 100
        let value = amount * (second.rate ?? 95)
        XCTAssert(ConversionUtil.convert(fromCurrency: base, amount: amount, toCurrency: second) == value)
    }
    
    func testSecondToBaseConversion() throws {
        let base = Currency.base
        let second = Currency.second
        let amount:Double = 9500
        let value = amount / (second.rate ?? 95)
        XCTAssert(ConversionUtil.convert(fromCurrency: second, amount: amount, toCurrency: base) == value)
    }
    
    func testThirdToSecondConversion() throws {
        let third = Currency.third
        let second = Currency.second
        let amount:Double = 13500
        let value = (amount / (third.rate ?? 135)) * (second.rate ?? 95)
        XCTAssert(ConversionUtil.convert(fromCurrency: third, amount: amount, toCurrency: second) == value)
    }
}
