import Foundation

struct DataSourceFactory {
    private let session = URLSession.shared
    
    func countryDataSource() -> CountryDataSource {
        let loader = CountryLoader(sessionProvider: session)
        return CountryDataSource(loader: loader)
    }
}
