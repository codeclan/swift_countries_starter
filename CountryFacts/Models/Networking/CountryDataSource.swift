import Foundation

class CountryDataSource {
    let loader: CountryLoading
    
    init(loader: CountryLoading) {
        self.loader = loader
    }
    
    func fetchAllCountries(success: @escaping ([Country]) -> (), failure: @escaping (Error) -> ()) {
        fetch(from: .all, success: success, failure: failure)
    }
    
    func fetchCountry(name: String, success: @escaping (Country) -> (), failure: @escaping (Error) -> ()) {
        fetch(
            from: .name(name),
            success: { countries in success(countries[0]) },
            failure: failure
        )
    }
    
    private func fetch(from endpoint: Endpoint, success: @escaping ([Country]) -> (), failure: @escaping (Error) -> ()) {
        loader.load(endpoint: endpoint) { data, response, error in
            guard let data = data else {
                return self.handleFailure(error: error, failure: failure)
            }
            
            do {
                let result = try self.parseCountries(from: data)
                success(result)
            } catch {
                failure(LoadingError.jsonParsing)
            }
                
        }
    }
    
    private func handleFailure(error: Error?, failure: @escaping (Error) -> ()) {
        if let error = error {
            failure(error)
        }
        return failure(LoadingError.unknown)
    }
    
    private func parseCountries(from data: Data) throws -> [Country] {
        let json = try JSON(JSONSerialization.jsonObject(
            with: data,
            options: .allowFragments
        ))
        return json.map(Country.parse).flatMap { $0 }

    }
}
