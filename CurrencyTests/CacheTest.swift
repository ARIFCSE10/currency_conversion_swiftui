//
//  CacheTest.swift
//  CurrencyTests
//
//  Created by Mohammed Badsha Alamgir on 22/8/22.
//

import XCTest

class CacheTest: XCTestCase {
    func testCacheInvalid() throws {
        let valid = CacheService.isCacheValid(timeStamp: 0)
        XCTAssertFalse(valid)
    }
    
    func testCacheValid() throws {
        let valid = CacheService.isCacheValid(timeStamp: Date.now.timeIntervalSince1970)
        XCTAssertTrue(valid)
    }
}
