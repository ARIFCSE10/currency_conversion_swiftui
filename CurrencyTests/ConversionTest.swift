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
        XCTAssert((second.rate ?? 0) * 100 == ConversionUtil.convert(fromCurrency: base, amount: 100.0, toCurrency: second))
    }
}
