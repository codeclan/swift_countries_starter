import Foundation

protocol URLSessionProviding {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    func dataTask(
        with url: URL,
        completionHandler: @escaping CompletionHandler
    ) -> URLSessionDataTask
}

extension URLSession: URLSessionProviding {}
