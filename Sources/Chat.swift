import Foundation
public class Chat: CustomStringConvertible {
    
    private let chat_id: Int
    private let chat_type: String
    
    init(id: Int, type: String) {
        self.chat_id = id
        self.chat_type = type
    }

    public var description: String {
        return "Chat= id: \(self.chat_id), type: \(self.chat_type)"
    }
    
    public var id: Int {
        return self.chat_id
    }
    
    public var type: String {
        return self.chat_type
    }
}
