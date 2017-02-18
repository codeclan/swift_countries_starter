import Foundation

protocol CountryLoading {
    typealias CompletionHandler = URLSessionProviding.CompletionHandler
    func load(
        endpoint: Endpoint,
        completionHandler: @escaping CompletionHandler
    )
}

class CountryLoader: CountryLoading {
    typealias CompletionHandler = CountryLoading.CompletionHandler
    
    let sessionProvider: URLSessionProviding
    
    init(sessionProvider: URLSessionProviding) {
        self.sessionProvider = sessionProvider
    }
    
    func load(
        endpoint: Endpoint,
        completionHandler: @escaping CompletionHandler
    ) {
        sessionProvider.dataTask(
            with: endpoint.url,
            completionHandler:  completionHandler
        ).resume()
    }
}
