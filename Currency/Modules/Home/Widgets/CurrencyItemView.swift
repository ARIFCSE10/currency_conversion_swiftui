//
//  CurrencyItemView.swift
//  Currency
//
//  Created by Mohammed Badsha Alamgir on 22/8/22.
//

import SwiftUI

struct CurrencyItemView: View {
    let code:String
    let rate:Double
    let amount:Double
    
    var body: some View {
        VStack{
            Text(code).bold()
            Divider()
            Text(String(format:"%.2f", rate * amount))
        }
        .padding(16.0)
        .border(.gray)
    }
}

struct CurrencyItemView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyItemView(code: "USD", rate: 1, amount: 100)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
