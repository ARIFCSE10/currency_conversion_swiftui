//
//  PopupMenuView.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 22/8/22.
//

import SwiftUI

struct PopupMenuView: View {
    var currencies: CurrencyMap
    var onCurrencySelected: ((_ option: Currency) -> Void)?

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 0) {
                ForEach(self.currencies.keys.sorted(), id: \.self) { key in
                    PopupMenuItemView(currency: currencies[key] ?? Currency.base, onCurrencySelected: self.onCurrencySelected)
                }
            }
        }
        .frame(minHeight: min(300, CGFloat(currencies.count) * 30))
        .padding(.vertical, 16)
        .background(Color.white)
        .cornerRadius(8)
    }
}

struct PopupMenuView_Previews: PreviewProvider {
    static let currencies:CurrencyMap =  ["USD": Currency.base]
    
    static var previews: some View {
        PopupMenuView(currencies: currencies) { _ in
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
