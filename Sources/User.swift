import Foundation

public class User: CustomStringConvertible {

    private let user_id: Int
    private let first_name: String

    public var description:String {
        return "User= id: \(self.user_id), first_name: \(self.first_name)"
    }
    
    init(id: Int, name: String) {
        self.user_id = id
        self.first_name = name
    }

    public func name() -> String {
        return self.first_name
    }

    public func id() -> Int {
        return self.user_id
    }
}