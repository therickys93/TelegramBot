import Foundation
class Chat: CustomStringConvertible {
    
    private let chat_id: Int
    private let chat_type: String
    
    init(id: Int, type: String) {
        self.chat_id = id
        self.chat_type = type
    }

    var description: String {
        return "Chat= id: \(self.chat_id), type: \(self.chat_type)"
    }

    func id() -> Int {
        return self.chat_id
    }

    func type() -> String {
        return self.chat_type
    }
}