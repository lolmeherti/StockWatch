//
//  File.swift
//  
//
//  Created by Alex H. on 30.12.22.
//

import Foundation
import StockWatch

@main
struct ExecutableAPI
{
    static let stocksAPI = StockWatch()
    
    static func main() async throws {
        if #available(macOS 12.0, *) {
            
            do {
                let quotes = try await stocksAPI.fetchQuotes(symbols: "")
                print(quotes)
                
                let tickers = try await stocksAPI.searchTickers(query: "tesla")
                print(tickers)
                
                let chart = try await stocksAPI.fetchChartData(symbol: "TSLA", range: .oneDay)
                print(chart ?? [])
                
                
            } catch {
                print(error.localizedDescription)
            }

        } else {
            throw APIServiceError.invalidResponseType//temporary solution
        }
    }
}
