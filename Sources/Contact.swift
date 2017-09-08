public class Contact: CustomStringConvertible {
    
    private let _name: String
    private let _telephone: String
    
    public var description: String {
        return "Contact= name:\(self._name), telephone:\(self._telephone)"
    }
    
    init(name: String, telephone: String){
        self._name = name
        self._telephone = telephone
    }
    
    public func name() -> String {
        return self._name
    }
    
    public func telephone() -> String {
        return self._telephone
    }
    
}
