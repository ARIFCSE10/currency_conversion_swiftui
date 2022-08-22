//
//  HomeViewModel.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 21/8/22.
//

import Foundation

protocol HomeViewModelProtocol:ObservableObject {
    func fetchCurrencies() async
    func fetchRates() async
}

@MainActor
final class HomeViewModel: HomeViewModelProtocol {
    private(set) var currencies:[Currency] = []
    private(set) var rates:ConversionModel? = nil
    @Published private(set) var currencyMap: CurrencyMap = CurrencyMap()
    @Published var selectedCurrency: Currency = Currency.base
    
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
    
    func loadData() async {
        if(CacheService.isCacheValid(timeStamp: LocalDataService.getTimeStamp())){
            print("using cached data")
            currencies = CacheService.loadCurrenciesCacheData()
            self.currencies.forEach { currency in
                currencyMap[currency.code] = currency
            }
        }else{
            print("using api data")
            Task{
                async let currenciesTask: () = fetchCurrencies()
                async let ratesTask: () = fetchRates()
                let _ = await [currenciesTask, ratesTask]
                CacheService.saveCurrenciesCacheData(currencies: currencyMap.values.reversed())
            }
        }
    }
    
    init(api:HomeApi) {
        self.api = api
        selectedCurrency =  Currency.base
    }
    
    
}
