//
//  HomeApi.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 21/8/22.
//

import Foundation

protocol HomeApiProtocol {
    func getCurrencies() async throws -> [Currency]
    func getRates() async throws -> ConversionModel?
}

final class HomeApi : HomeApiProtocol{
    func getCurrencies() async throws -> [Currency] {
        let url:String = "\(Constants.baseUrl)\(Constants.currencyListPath)?\(Constants.appIdQueryParamKey)=\(Constants.appId)"
        let (data,_) = try await URLSession.shared.data(from:URL(string: url)!)
        
        let currencies = try? JSONDecoder().decode(CurrencyModel.self, from:data)
        return currencies?.map({ key, value in
            return Currency(rate: nil, code: key, name: value)
        }) ?? []
    }
    
    func getRates() async throws -> ConversionModel? {
        let url:String = "\(Constants.baseUrl)\(Constants.latestPath)?\(Constants.appIdQueryParamKey)=\(Constants.appId)"
        let (data,_) = try await URLSession.shared.data(from:URL(string: url)!)
        
        let rates = try? JSONDecoder().decode(ConversionModel.self, from:data)
        return rates
    }
}
