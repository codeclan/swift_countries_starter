import XCTest
@testable import CountryFacts

class LatLongTests: XCTestCase {
    
    var sut: LatLong!
    
    // MARK: init
    
    func test_lat_1point1_returns1point1() {
        sut = .create(lat: 1.1)
        XCTAssertEqual(1.1, sut.lat)
    }
    
    func test_lat_99point315_returns99point315() {
        sut = .create(lat: 99.315)
        XCTAssertEqual(99.315, sut.lat)
    }
    
    func test_long_minus6point2_returnsMinus6point2() {
        sut = .create(long: -6.2)
        XCTAssertEqual(-6.2, sut.long)
    }
    
    func test_long_105point9999_returns105point9999() {
        sut = .create(long: 105.9999)
        XCTAssertEqual(105.9999, sut.long)
    }
    
    // MARK: equals
    
    var lhs: LatLong!
    var rhs: LatLong!
    
    func test_equals_matching_true() {
        (lhs, rhs) = (.create(), .create())
        XCTAssert(lhs == rhs)
        XCTAssert(rhs == lhs)
    }
    
    func test_equals_latNotMatching_false() {
        (lhs, rhs) = (.create(), .create(lat: 1))
        XCTAssert(lhs != rhs)
        XCTAssert(rhs != lhs)
    }
    
    func test_equals_longNotMatching_false() {
        (lhs, rhs) = (.create(), .create(long: 1))
        XCTAssert(lhs != rhs)
        XCTAssert(rhs != lhs)
    }
    
}

extension LatLong {
    static func create(
        lat: Double = 0,
        long: Double = 0
    ) -> LatLong {
        return LatLong(
            lat: lat,
            long: long
        )
    }
}
