import XCTest
@testable import CountryFacts

class CountryLoaderTests: XCTestCase {
    
    private var mockSessionProvider: MockURLSessionProviding!
    private var sut: CountryLoader!
    
    override func setUp() {
        mockSessionProvider = MockURLSessionProviding()
        sut = CountryLoader(sessionProvider: mockSessionProvider)
    }
    
    func test_loadEndpoint_startsDataTask() {
        sut.load(endpoint: .all, completionHandler: { _ in })
        XCTAssertTrue(mockSessionProvider.didStartDataTask)
    }
    
    func test_loadEndpoint_all_startsDataTaskWithAllURL() {
        let expected = URL(string: "https://restcountries.eu/rest/v1/all")
        sut.load(endpoint: .all, completionHandler: { _ in })
        XCTAssertEqual(expected, mockSessionProvider.spyURL)
    }
    
    func test_loadEndpoint_name_startsDataTaskWithNameURL() {
        let expected = URL(string: "https://restcountries.eu/rest/v1/name/a")
        sut.load(endpoint: .name("a"), completionHandler: { _ in})
        XCTAssertEqual(expected, mockSessionProvider.spyURL)
    }
    
    func test_loadEndpoint_passesCompletionHandlerToSessionProvider() {
        var didCallHandler = false
        let completion = { (data: Data?, response: URLResponse?, error: Error?) in
            didCallHandler = true
        }
        sut.load(endpoint: .all, completionHandler: completion)
        mockSessionProvider.spyCompletionHandler?(nil, nil, nil)
        XCTAssertTrue(didCallHandler)
    }
    
    func test_loadEndpoint_resumesTask() {
        mockSessionProvider.stubTask = MockDataTask()
        sut.load(endpoint: .all, completionHandler: { _ in })
        XCTAssertTrue(mockSessionProvider.stubTask?.didResume ?? false)
    }
    
}

private class MockURLSessionProviding: URLSessionProviding {
    var didStartDataTask = false
    var spyURL: URL? = nil
    var spyCompletionHandler: ((Data?, URLResponse?, Error?) -> Void)? = nil
    
    var stubTask: MockDataTask? = nil
    
    func dataTask(
        with url: URL,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask {
        didStartDataTask = true
        spyURL = url
        spyCompletionHandler = completionHandler
        return stubTask ?? MockDataTask()
    }
}

private class MockDataTask: URLSessionDataTask {
    var didResume = false
    
    override func resume() {
        didResume = true
    }
}
