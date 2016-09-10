import Foundation
class Update: CustomStringConvertible {

    private let update_id: Int
    private let update_message: Message

    init(id: Int, message: Message) {
        self.update_id = id
        self.update_message = message
    }

    var description: String {
        return "Update= id: \(self.update_id), message: \(self.update_message)"
    }

    func id() -> Int {
        return self.update_id
    }

    func message() -> Message {
        return self.update_message
    }

}