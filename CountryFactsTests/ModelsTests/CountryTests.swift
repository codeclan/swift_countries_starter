import XCTest
@testable import CountryFacts

class CountryTests: XCTestCase {
    
    var sut: Country!
    
    // MARK: init
    
    func test_name_USA_returnsUSA() {
        sut = .create(name: "USA")
        XCTAssertEqual("USA", sut.name)
    }
    
    func test_name_Brazil_returnsBrazil() {
        sut = .create(name: "Brazil")
        XCTAssertEqual("Brazil", sut.name)
    }
    
    func test_population_5_returns5() {
        sut = .create(population: 5)
        XCTAssertEqual(5, sut.population)
    }
    
    func test_population_23006_returns23006() {
        sut = .create(population: 23_006)
        XCTAssertEqual(23_006, sut.population)
    }
    
    func test_capital_Glasgow_returnsGlasgow() {
        sut = .create(capital: "Glasgow")
        XCTAssertEqual("Glasgow", sut.capital)
    }
    
    func test_capital_Cardiff_returnsCardiff() {
        sut = .create(capital: "Cardiff")
        XCTAssertEqual("Cardiff", sut.capital)
    }
    
    func test_region_Asia_returnsAsia() {
        sut = .create(region: "Asia")
        XCTAssertEqual("Asia", sut.region)
    }
    
    func test_region_Europe_returnsEurope() {
        sut = .create(region: "Europe")
        XCTAssertEqual("Europe", sut.region)
    }
    
    func test_latLong_Lat53Lng3_returnsLat53Lng3() {
        let expected: LatLong = .create(lat: 53, long: 3)
        sut = .create(latLong: expected)
        XCTAssertEqual(expected, sut.latLong)
    }
    
    func test_latLong_Lat1Lng12_returnsLat1Lng12() {
        let expected: LatLong = .create(lat: 1, long: 12)
        sut = .create(latLong: expected)
        XCTAssertEqual(expected, sut.latLong)
    }
    
    func test_alpha3Code_ABC_returnsABC() {
        sut = .create(alpha3Code: "ABC")
        XCTAssertEqual("ABC", sut.alpha3Code)
    }
    
    func test_alpha3Code_DEF_returnsDEF() {
        sut = .create(alpha3Code: "DEF")
        XCTAssertEqual("DEF", sut.alpha3Code)
    }
    
    func test_borders_ABCandDEF_returnsABCandDEF() {
        let expected = ["ABC", "DEF"]
        sut = .create(borders: expected)
        XCTAssertEqual(expected, sut.borders)
    }
    
    func test_borders_GHI_returnsGHI() {
        let expected = ["GHI"]
        sut = .create(borders: expected)
        XCTAssertEqual(expected, sut.borders)
    }
    
    // MARK: equals
    
    var lhs: Country!
    var rhs: Country!
    
    func test_equals_matching_true() {
        (lhs, rhs) = (.create(), .create())
        XCTAssert(lhs == rhs)
        XCTAssert(rhs == lhs)
    }
    
    func test_equals_namesDiffer_false() {
        (lhs, rhs) = (.create(), .create(name: "blah"))
        XCTAssert(lhs != rhs)
        XCTAssert(rhs != lhs)
    }
    
    func test_equals_alpha3CodesDiffer_false() {
        (lhs, rhs) = (.create(), .create(alpha3Code: "D"))
        XCTAssert(lhs != rhs)
        XCTAssert(rhs != lhs)
    }
    
    func test_equals_populationsDiffer_false() {
        (lhs, rhs) = (.create(), .create(population: 1))
        XCTAssert(lhs != rhs)
        XCTAssert(rhs != lhs)
    }
    
    func test_equals_capitalsDiffer_false() {
        (lhs, rhs) = (.create(), .create(capital: "abc"))
        XCTAssert(lhs != rhs)
        XCTAssert(rhs != lhs)
    }
    
    func test_equals_regionsDiffer_false() {
        (lhs, rhs) = (.create(), .create(region: "meh"))
        XCTAssert(lhs != rhs)
        XCTAssert(rhs != lhs)
    }
    
    func test_equals_latLongsDiffer_false() {
        (lhs, rhs) = (.create(), .create(latLong: .create(lat: 1)))
        XCTAssert(lhs != rhs)
        XCTAssert(rhs != lhs)
    }
    
    func test_equals_bordersDiffer_false() {
        (lhs, rhs) = (.create(), .create(borders: [""]))
        XCTAssert(lhs != rhs)
        XCTAssert(rhs != lhs)
    }
    
}

extension Country {
    static func create(
        name: String = "",
        alpha3Code: String = "",
        population: Int = 0,
        capital: String = "",
        region: String = "",
        latLong: LatLong = .create(),
        borders: [String] = []
    ) -> Country {
        return Country(
            name: name,
            alpha3Code: alpha3Code,
            population: population,
            capital: capital,
            region: region,
            latLong: latLong,
            borders: borders
        )
    }
}
