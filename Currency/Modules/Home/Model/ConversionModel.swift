import Foundation


typealias CurrencyModel = [String: String]
typealias CurrencyMap = [String: Currency]


struct ConversionModel: Codable {
    let disclaimer: String
    let license: String
    let timestamp: Int
    let base: String
    let rates: [String: Double]
}
