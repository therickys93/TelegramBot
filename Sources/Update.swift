import Foundation
public class Update: CustomStringConvertible {

    private let update_id: Int
    private let update_message: Message

    init(id: Int, message: Message) {
        self.update_id = id
        self.update_message = message
    }

    public var description: String {
        return "Update= id: \(self.update_id), message: \(self.update_message)"
    }
    
    public var id: Int {
        return self.update_id
    }

    public var message: Message {
        return self.update_message
    }
}
