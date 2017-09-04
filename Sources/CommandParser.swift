import Foundation

public class CommandParser {
    
    public var command: String {
        return _command
    }
    
    public var argument: String {
        return _argument
    }
    
    private var _command: String
    private var _argument: String
    
    public init(_ command: String?) {
        if let com = command {
            // not nil
            var array = com.components(separatedBy: " ")
            _command = array[0]
            array.remove(at: 0)
            _argument = array.joined(separator: " ")
        } else {
            // is nil
            _command = ""
            _argument = ""
        }
    }
    
}
