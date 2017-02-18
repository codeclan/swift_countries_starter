import Foundation

class JSON {
    private let raw: Any?
    
    init(_ raw: Any?) {
        self.raw = raw
    }
    
    private var nsArray: NSArray? {
        return raw as? NSArray
    }
    
    private var nsDictionary: NSDictionary? {
        return raw as? NSDictionary
    }
    
    var string: String? { return raw as? String }
    
    var int: Int? { return raw as? Int }
    
    var double: Double? { return raw as? Double }
    
    subscript(_ key: String) -> JSON {
        guard let dict = nsDictionary, let val = dict[key] else {
            return JSON(nil)
        }
        return JSON(val)
    }
    
    subscript(_ index: Int) -> JSON {
        guard let arr = nsArray, index < arr.count else {
            return JSON(nil)
        }
        return JSON(arr[index])
    }
    
    func map<T>(_ f: (JSON) -> T) -> [T] {
        guard let arr = nsArray else {
            return []
        }
        return arr.map(JSON.init).map(f)
    }
}
