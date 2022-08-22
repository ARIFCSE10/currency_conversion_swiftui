//
//  HomeViewModel.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 21/8/22.
//

import Foundation

protocol HomeViewModelProtocol:ObservableObject {
    func fetchCurrencies() async
}

@MainActor
final class HomeViewModel: HomeViewModelProtocol {
    private(set) var currencies:[Currency] = []
    private(set) var rates:ConversionModel? = nil
    @Published private(set) var currencyMap: CurrencyMap = CurrencyMap()
    
    private let api:HomeApi
    
    
    func fetchCurrencies() async{
        do{
            self.currencies = try await self.api.getCurrencies()
            self.currencies.forEach { currency in
                currencyMap[currency.code] = currency
            }
        }catch{
            print(error)
        }
    }
    
    func fetchRates() async{
        do{
            self.rates = try await self.api.getRates()
            self.rates?.rates.forEach({ key, value in
                currencyMap[key]?.rate = value
            })
        }catch{
            print(error)
        }
    }
    
    init(api:HomeApi) {
        self.api = api
    }
    
    
}