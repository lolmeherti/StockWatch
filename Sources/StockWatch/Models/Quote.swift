//
//  File.swift
//  
//
//  Created by Alex H. on 30.12.22.
//

import Foundation

public struct Quote:Codable, Identifiable, Hashable {
    public let id = UUID() //fix later
    
    
    public let currency: String?
    public let marketState: String?
    public let fullExchangeName: String?
    public let displayName: String?
    public let symbol: String?
    //regular price today
    public let regularMarketPrice: Double?
    //difference between now and previous trading days
    public let regularMarketChange: Double?
    public let regularMarketChangePercent: Double?
    public let regularMarketPreviousClose: Double?

    public let regularMarketTime: Date?
    
    public let postMarketPrice: Double?
    public let postMarketChange: Double?
    
    public let regularMarketOpen: Double?
    
    public let regularMarketDayHigh: Double?
    public let regularMarketDayLow: Double?
    
    public let regularMarketVolume: Double?
    public let trailingPE: Double?
    public let marketCap: Double?
    
    
    public let fiftyTwoWeekHigh:Double?
    public let fiftyTwoWeekLow:Double?
    
    public let averageDailyVolume3Month:Double?
    
    public let trailingAnnualDividendYield:Double?
    public let epsTrailingTwelveMonths:Double?
    
    
    //i trusted xcode to generate this...
    public init(currency: String?, marketState: String?, fullExchangeName: String?, displayName: String?, symbol: String?, regularMarketPrice: Double?, regularMarketChange: Double?, regularMarketChangePercent: Double?, regularMarketPreviousClose: Double?, regularMarketTime: Date?, postMarketPrice: Double?, postMarketChange: Double?, regularMarketOpen: Double?, regularMarketDayHigh: Double?, regularMarketDayLow: Double?, regularMarketVolume: Double?, trailingPE: Double?, marketCap: Double?, fiftyTwoWeekHigh: Double?, fiftyTwoWeekLow: Double?, averageDailyVolume3Month: Double?, trailingAnnualDividendYield: Double?, epsTrailingTwelveMonths: Double?) {
        self.currency = currency
        self.marketState = marketState
        self.fullExchangeName = fullExchangeName
        self.displayName = displayName
        self.symbol = symbol
        self.regularMarketPrice = regularMarketPrice
        self.regularMarketChange = regularMarketChange
        self.regularMarketChangePercent = regularMarketChangePercent
        self.regularMarketPreviousClose = regularMarketPreviousClose
        self.regularMarketTime = regularMarketTime
        self.postMarketPrice = postMarketPrice
        self.postMarketChange = postMarketChange
        self.regularMarketOpen = regularMarketOpen
        self.regularMarketDayHigh = regularMarketDayHigh
        self.regularMarketDayLow = regularMarketDayLow
        self.regularMarketVolume = regularMarketVolume
        self.trailingPE = trailingPE
        self.marketCap = marketCap
        self.fiftyTwoWeekHigh = fiftyTwoWeekHigh
        self.fiftyTwoWeekLow = fiftyTwoWeekLow
        self.averageDailyVolume3Month = averageDailyVolume3Month
        self.trailingAnnualDividendYield = trailingAnnualDividendYield
        self.epsTrailingTwelveMonths = epsTrailingTwelveMonths
    }
    
}
