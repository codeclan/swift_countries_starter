import XCTest
@testable import CountryFacts

class URLProvidingTests: XCTestCase {
    
    func test_url_baseURLIsExample_pathIsEmpty_returnsBaseURL() {
        let url = URL(string: "www.example.com/")!
        let sut = PartialMockURLProviding(baseURL: url, path: "")
        XCTAssertEqual(url, sut.url)
    }
    
    func test_url_baseURLIsGoogle_pathIsSome_appendsPath() {
        let expected = URL(string: "www.google.com/some")!
        let url = URL(string: "www.google.com/")!
        let sut = PartialMockURLProviding(baseURL: url, path: "some")
        XCTAssertEqual(expected, sut.url)
    }
    
    func test_url_baseURLIsExample_pathIsHelloWorld_appendsPath() {
        let expected = URL(string: "www.example.com/hello/world")!
        let url = URL(string: "www.example.com/")!
        let sut = PartialMockURLProviding(baseURL: url, path: "hello/world")
        XCTAssertEqual(expected, sut.url)
    }

}

private class PartialMockURLProviding: URLProviding {
    let baseURL: URL
    let path: String
    
    init(baseURL: URL, path: String) {
        self.baseURL = baseURL
        self.path = path
    }
}
