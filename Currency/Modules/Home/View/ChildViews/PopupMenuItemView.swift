//
//  PopupMenuItemView.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 22/8/22.
//

import SwiftUI

struct PopupMenuItemView: View {
    var currency: Currency
    var onCurrencySelected: ((_ currency: Currency) -> Void)?

    var body: some View {
        Button(action: {
            if let onCurrencySelected = self.onCurrencySelected {
                onCurrencySelected(self.currency)
            }
        }) {
            HStack {
                Text(self.currency.code)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                Spacer()
                Text(self.currency.name)
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .border(.thinMaterial)
    }
}

struct PopupMenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        PopupMenuItemView(currency: Currency(code: "USD", name: "US Dollar")) { currency in
        }
    }
}
