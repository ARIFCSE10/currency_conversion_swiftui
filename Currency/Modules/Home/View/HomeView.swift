//
//  ContentView.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 21/8/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm:HomeViewModel = HomeViewModel(api: HomeApi())
    @State private var amount: String = "100"
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            if(vm.currencyMap.isEmpty){
                ProgressView()
            }else{
                VStack{
                    TextField("Enter Amount", text: $amount)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    
                    GroupBox {
                        HStack{
                            Text(vm.selectedCurrency.code)
                            Spacer()
                            Text(vm.selectedCurrency.name)
                        }.onTapGesture {
                            self.showingAlert = true
                        }
                        .sheet(isPresented: $showingAlert) {
                            self.showingAlert = false
                        } content: {
                            PopupMenuView(currencies: vm.currencyMap) { currency in
                                vm.selectedCurrency = currency
                                self.showingAlert = false
                            }
                        }
                        
                    }
                    .padding()
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))], spacing: 16) {
                            ForEach(vm.currencyMap.keys.sorted(), id: \.self) { key in
                                CurrencyItemView(
                                    currency: vm.selectedCurrency,
                                    amount: Double(amount) ?? 0.0,
                                    toCurrency: vm.currencyMap[key] ?? Currency.base) { currency in
                                        vm.selectedCurrency = currency
                                    }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .navigationTitle("Conversion")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Base") {
                        vm.selectedCurrency = Currency.base
                        amount = "100"
                    }
                }
            }
        }
        .task {
            await vm.fetchCurrencies()
            await vm.fetchRates()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
