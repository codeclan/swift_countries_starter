import XCTest
@testable import CountryFacts

class EndpointsTests: XCTestCase {
    
    // MARK: properties
    
    func test_all_pathIsCorrect() {
        let expected = "all"
        let sut = Endpoint.all
        XCTAssertEqual(expected, sut.path)
    }
    
    func test_name_albania_pathIsCorrect() {
        let expected = "name/Albania"
        let sut = Endpoint.name("Albania")
        XCTAssertEqual(expected, sut.path)
    }
    
    func test_any_baseURLIsCorrect() {
        let expected = URL(string: "https://restcountries.eu/rest/v1")!
        XCTAssertEqual(expected, Endpoint.all.baseURL)
    }
    
    // n.b. see URLProvidingTests for further verification
    func test_all_url_works() {
        let expected = URL(string: "https://restcountries.eu/rest/v1/all")!
        let sut = Endpoint.all
        XCTAssertEqual(expected, sut.url)
    }
    
    // MARK: equals tests
    
    var lhs: Endpoint!
    var rhs: Endpoint!
    
    func test_equals_bothAll_true() {
        (lhs, rhs) = (.all, .all)
        XCTAssert(lhs == rhs)
        XCTAssert(rhs == lhs)
    }
    
    func test_equals_oneAlloneName_false() {
        (lhs, rhs) = (.all, .name(""))
        XCTAssert(lhs != rhs)
        XCTAssert(rhs != lhs)
    }
    
    func test_equals_bothSameName_true() {
        (lhs, rhs) = (.name("a"), .name("a"))
        XCTAssert(lhs == rhs)
        XCTAssert(rhs == lhs)
    }
    
    func test_equals_differentNames_false() {
        (lhs, rhs) = (.name("a"), .name("b"))
        XCTAssert(lhs != rhs)
        XCTAssert(rhs != lhs)
    }
    
}
