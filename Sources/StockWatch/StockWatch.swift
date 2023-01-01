import Foundation

public struct StockWatch {
    private let session = URLSession.shared
    private let jsonDecoder =
    {
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .secondsSince1970
        
        return decoder
    }()
    
    private let baseUrl = "https://query1.finance.yahoo.com"

    public init()
    {
        
    }
    
    public func fetchChartData(symbol: String, range: ChartRange) async throws -> ChartData?
    {
        
        guard var urlComponents = URLComponents(string: "\(baseUrl)/v8/finance/chart/\(symbol)") else
        {
            return nil
        }
        
        urlComponents.queryItems = [
            .init(name: "range", value: range.rawValue),
            .init(name: "interval", value: range.interval),
            .init(name: "indicators", value: "quote"),
            .init(name: "includeTimestamps", value: "true")
        ]
        
        guard let url = urlComponents.url else
        {
            throw APIServiceError.invalidURL
        }
        
        let (response, statusCode): (ChartResponse, Int) = try await fetch(url: url)
        
        if let error = response.error
        {
            throw APIServiceError.httpStatusCodeFailed(statusCode: statusCode, error: error)
        }
        
        return response.data?.first
        
    }
    
                                                            /*just for now*/
    public func searchTickers(query: String, isEquityTypeOnly: Bool = true) async throws -> [Ticker] {
        
        guard var urlComponents = URLComponents(string: "\(baseUrl)/v1/finance/search") else
        {
            throw APIServiceError.invalidURL
        }
        
        urlComponents.queryItems =
        [
            .init(name: "q", value: query),
            .init(name: "quotesCount", value: "20"),
            .init(name: "lang", value: "en-US")
        ]
        
        guard let url = urlComponents.url else
        {
            throw APIServiceError.invalidURL
        }
        
        let (response, statusCode): (SearchTickers, Int) = try await fetch(url: url)
        
        if let error = response.error
        {
            throw APIServiceError.httpStatusCodeFailed(statusCode: statusCode, error: error)
        }
        
        let data = response.data ?? []
        
        if(isEquityTypeOnly)
        {
            return data.filter { ($0.quoteType ?? "").localizedCaseInsensitiveCompare("equity") == .orderedSame }
        } else {
            return data
        }
    }
    
    public func fetchQuotes(symbols: String) async throws -> [Quote] {
        
        guard var urlComponents = URLComponents(string: "\(baseUrl)/v7/finance/quote") else
        {
            throw APIServiceError.invalidURL
        }
        
        urlComponents.queryItems = [.init(name: "symbols", value: symbols)]
        
        guard let url = urlComponents.url else
        {
            throw APIServiceError.invalidURL
        }
    
        let (response, statusCode): (QuoteResponse, Int) = try await fetch(url: url)
        
        if let error = response.error
        {
            throw APIServiceError.httpStatusCodeFailed(statusCode: statusCode, error: error)
        }
        
        return response.data ?? []
    }
    
    private func fetch<D: Decodable >(url: URL) async throws -> (D, Int)
    {
        if #available(macOS 12.0, *) {
            let (data, response) = try await session.data(from: url)
            let statusCode = try validateHTTPResponse(response)
            return (try jsonDecoder.decode(D.self, from: data), statusCode)
        } else {
            throw APIServiceError.invalidURL
        }
    }
    
    private func validateHTTPResponse(_ response:URLResponse) throws -> Int
    {
        guard let httpResponse = response as? HTTPURLResponse else
        {
            throw APIServiceError.invalidResponseType
        }
        
        //http response code must fall in range
        guard 200...299 ~= httpResponse.statusCode ||
                400...499 ~= httpResponse.statusCode
        else
        {
            throw APIServiceError.httpStatusCodeFailed(statusCode: httpResponse.statusCode, error: nil)
        }
        
        return httpResponse.statusCode
                
    }
}
