struct LatLong: Equatable {
    let lat: Double
    let long: Double
    
    static func ==(lhs: LatLong, rhs: LatLong) -> Bool {
        return lhs.lat == rhs.lat
            && lhs.long == rhs.long
    }
    
    static func parse(json: JSON) -> LatLong? {
        guard
            let lat = json[0].double,
            let long = json[1].double
        else {
            return nil
        }
        return LatLong(lat: lat, long: long)
    }
}
