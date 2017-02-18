import Foundation

enum Endpoint: URLProviding, Equatable {
    case all
    case name(String)
    
    static func ==(lhs: Endpoint, rhs: Endpoint) -> Bool {
        switch (lhs, rhs) {
        case (.all, .all): return true
        case (.name(let lhsName), .name(let rhsName)):
            return lhsName == rhsName
        default: return false
        }
    }
    
    var baseURL: URL {
        return URL(string: "https://restcountries.eu/rest/v1")!
    }
    
    var path: String {
        switch self {
        case .all: return "all"
        case .name(let countryName): return "name/\(countryName)"
        }
    }
    
}
