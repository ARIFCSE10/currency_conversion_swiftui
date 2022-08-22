//
//  CurrencyItemView.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 22/8/22.
//

import SwiftUI

struct CurrencyItemView: View {
    let currency:Currency
    let amount:Double
    let toCurrency:Currency
    var onCurrencySelected: ((_ currency: Currency) -> Void)?

    var body: some View {
        VStack{
            Text(toCurrency.code).bold()
            Divider()
            Text(
                String(
                    format:"%.2f",
                    ConversionUtil.convert(
                        fromCurrency: currency,
                        amount: amount,
                        toCurrency: toCurrency
                    )
                )
            )
        }
        .padding(16.0)
        .border(currency.code == toCurrency.code  ? .green : .gray, width: currency.code == toCurrency.code  ? 3 : 1)
        .onTapGesture {
            if let onCurrencySelected = self.onCurrencySelected {
                onCurrencySelected(self.toCurrency)
            }
        }
    }
}

struct CurrencyItemView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyItemView(currency: Currency.base, amount: 100, toCurrency: Currency.second)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
