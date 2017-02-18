struct Country: Equatable {
    let name: String
    let alpha3Code: String
    let population: Int
    let capital: String
    let region: String
    let latLong: LatLong
    let borders: [String]
    
    static func ==(lhs: Country, rhs: Country) -> Bool {
        return lhs.name == rhs.name
            && lhs.alpha3Code == rhs.alpha3Code
            && lhs.population == rhs.population
            && lhs.capital == rhs.capital
            && lhs.region == rhs.region
            && lhs.latLong == rhs.latLong
            && lhs.borders == rhs.borders
    }
    
    static func parse(json: JSON) -> Country? {
        guard
            let name = json["name"].string,
            let alpha3Code = json["alpha3Code"].string,
            let population = json["population"].int,
            let capital = json["capital"].string,
            let region = json["region"].string,
            let latLong = LatLong.parse(json: json["latlng"])
        else {
            return nil
        }
        let borders = json.map { $0.string }.flatMap { $0 }
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
