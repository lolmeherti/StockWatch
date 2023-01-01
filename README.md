# StockWatchAPI

This is an API built around Yahoo!Finance.

### Documentation

Compatibility

```
    platforms:[
        .iOS(.v13), .macOS(.v12), .macCatalyst(.v13), .tvOS(.v13), .watchOS(.v8)
    ]
```

### Searching for a ticker:

```
stocksAPI.searchTickers(query: "tesla")
```

Output:

```
[StockWatch.Ticker(
id: 84C7294C-BA04-4FDC-B4CB-1222384EA839, 
symbol: "TSLA", 
quoteType: Optional("EQUITY"), 
shortname: Optional("Tesla, Inc."), 
longname: Optional("Tesla, Inc."), 
sector: Optional("Consumer Cyclical"), 
industry: Optional("Auto Manufacturers"), 
exchDisp: Optional("NASDAQ"))]
```


### API call with ticker(s)

```
stocksAPI.fetchQuotes(symbols: "TSLA")
```

Output:

```
[StockWatch.Quote(
id: 3696DF20-CDF4-4FCE-A804-975A132FABA2, 
currency: Optional("USD"), 
marketState: Optional("CLOSED"), 
fullExchangeName: Optional("NasdaqGS"), 
displayName: Optional("Tesla"), 
symbol: Optional("TSLA"), 
regularMarketPrice: Optional(123.18), 
regularMarketChange: Optional(1.3600006), 
regularMarketChangePercent: Optional(1.1164018), 
regularMarketPreviousClose: Optional(121.82), 
regularMarketTime: Optional(2022-12-30 21:00:04 +0000), 
postMarketPrice: Optional(123.48), 
postMarketChange: Optional(0.300003), 
regularMarketOpen: Optional(119.95), 
regularMarketDayHigh: Optional(124.47), 
regularMarketDayLow: Optional(119.7675), 
regularMarketVolume: Optional(156403696.0), 
trailingPE: Optional(35.295128), 
marketCap: Optional(388971659264.0), 
fiftyTwoWeekHigh: Optional(402.66666), 
fiftyTwoWeekLow: Optional(108.24), 
averageDailyVolume3Month: Optional(104173157.0), 
trailingAnnualDividendYield: Optional(0.0), 
epsTrailingTwelveMonths: Optional(3.49))]
```
You can pass multiple tickers as a string, separated by commas with no white spaces in between: "TSLA,AAPL.."

### Last but not least, fetching data for a chart

Must pass a ticker and a range

```
stocksAPI.fetchChartData(symbol: "TSLA", range: .oneDay)
```

The enum ranges can be

```
    .oneDay = "1d"
    .oneWeek = "5d"
    .oneMonth = "1mo"
    .threeMonths = "3mo"
    .sixMonths = "6mo"
    .ytd = "ytd"
    .oneYear = "1y"
    .twoYears = "2y"
    .fiveYears = "5y"
    .tenYears = "10y"
    .max = "max"
```
