import Foundation

protocol URLProviding {
    var baseURL: URL { get }
    var path: String { get }
}

extension URLProviding {
    var url: URL {
        return baseURL.appendingPathComponent(path)
    }
}
