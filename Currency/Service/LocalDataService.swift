//
//  LocalDataService.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 22/8/22.
//

import Foundation

struct LocalDataService{
    static let preferences = UserDefaults.standard
    static let timeStampKey = "TIMESTAMP"
    static let currencyListKey = "CURRENCY_LIST"
    
    static func setTimeStamp(timeStamp:Double){
        preferences.set(timeStamp, forKey: timeStampKey)
        preferences.synchronize()
    }
    
    static func getTimeStamp()-> Double{
       return preferences.double(forKey: timeStampKey)
    }
    
    static func setCurrencies(currencies:[Currency]){
        let currenciesJson = try? JSONEncoder().encode(currencies)
        preferences.set(currenciesJson ?? "", forKey: currencyListKey)
        preferences.synchronize()
    }
    
    static func getCurrencies()-> [Currency]{
        guard let currenciesData = preferences.data(forKey: currencyListKey) else { return [] }
        let currencies = try? JSONDecoder().decode([Currency].self, from: currenciesData)
        return currencies ?? []
    }
}
