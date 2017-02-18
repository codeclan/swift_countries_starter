import XCTest
@testable import CountryFacts

class CountryDataSourceTests: XCTestCase {
    
    private var mockLoader: MockCountryLoader!
    private var sut: CountryDataSource!
    
    override func setUp() {
        mockLoader = MockCountryLoader()
        sut = CountryDataSource(loader: mockLoader)
    }
    
    func test_fetchAllCountries_callsLoad() {
        sut.fetchAllCountries(success: {_ in}, failure: {_ in})
        XCTAssertTrue(mockLoader.didLoad)
    }
    
    func test_fetchAllCountries_callsLoadWithAllEndpoint() {
        sut.fetchAllCountries(success: {_ in }, failure: {_ in})
        XCTAssertEqual(Endpoint.all, mockLoader.spyEndpoint)
    }
    
    func test_fetchAllCountries_callsFailureHandlerWhenErrorIsNonNil() {
        var didCallFailure = false
        sut.fetchAllCountries(
            success: {_ in},
            failure: { _ in didCallFailure = true }
        )
        mockLoader.spyCompletionHandler?(nil, nil, SomeError.bad)
        XCTAssertTrue(didCallFailure)
    }
    
    func test_fetchAllCountries_callsSuccessHandlerWhenErrorIsNil() {
        var didCallSuccess = false
        sut.fetchAllCountries(
            success: { _ in didCallSuccess = true },
            failure: {_ in}
        )
        let data = "[]".data(using: .utf8)
        mockLoader.spyCompletionHandler?(data, nil, nil)
        XCTAssertTrue(didCallSuccess)
    }
    
}

private class MockCountryLoader: CountryLoading {
    var didLoad = false
    var spyEndpoint: Endpoint?
    var spyCompletionHandler: CountryLoading.CompletionHandler?
    func load(
        endpoint: Endpoint,
        completionHandler: @escaping CountryLoading.CompletionHandler
    ) {
        didLoad = true
        spyEndpoint = endpoint
        spyCompletionHandler = completionHandler
    }
}

private enum SomeError: Error {
    case bad
}
