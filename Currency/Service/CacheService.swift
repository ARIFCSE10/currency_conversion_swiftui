//
//  CacheService.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 22/8/22.
//

import Foundation

struct CacheService{
    static func isCacheValid(timeStamp:Double)-> Bool{
        let lastApiCallDateTime = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        let currentDateTime = Date.now
        let timeDifference = currentDateTime.timeIntervalSince(lastApiCallDateTime)
        let thirtyMins:Double = 30 * 60
        return timeDifference < thirtyMins
    }
    
    static func saveCurrenciesCacheData(currencies:[Currency]){
        LocalDataService.setTimeStamp(timeStamp: Date.now.timeIntervalSince1970)
        LocalDataService.setCurrencies(currencies: currencies)
    }
    
    static func loadCurrenciesCacheData()-> [Currency]{
        return LocalDataService.getCurrencies()
    }
}
