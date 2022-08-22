//
//  ContentView.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 21/8/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm:HomeViewModel = HomeViewModel(api: HomeApi())
    @State private var amount: String = ""
    
    var body: some View {
        NavigationView{
            Group{
                if(vm.currencyMap.isEmpty){
                    ProgressView()
                }else{
                    VStack{
                        TextField("Enter Amount", text: $amount)
                            .padding(.horizontal)
                            .padding(16)
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))], spacing: 16) {
                                ForEach(vm.currencyMap.keys.sorted(), id: \.self) { key in
                                    CurrencyItemView(code: vm.currencyMap[key]?.code ?? "", rate: vm.currencyMap[key]?.rate ?? 0, amount: Double(amount) ?? 0)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Conversion")
            .navigationBarTitleDisplayMode(.automatic)
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
