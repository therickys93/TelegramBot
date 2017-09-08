import Foundation
public class Message: CustomStringConvertible {
    
    private let message_id: Int
    private let from_user: User
    private let user_chat: Chat
    private let message_date: Int
    private let message_text: String?
    private let _contact: Contact?

    init(id: Int, user: User, chat: Chat, date: Int, text: String?, contact: Contact?) {
        self.message_id = id
        self.from_user = user
        self.user_chat = chat
        self.message_date = date
        self.message_text = text
        self._contact = contact
    }

    public var description: String {
        return "Message= id: \(self.message_id), user: \(self.from_user), chat: \(self.user_chat), date: \(self.message_date), text: \(self.message_text ?? "nil")"
    }

    public func id() -> Int {
        return self.message_id
    }

    public func user() -> User {
        return self.from_user
    }

    public func chat() -> Chat {
        return self.user_chat
    }

    public func date() -> Int {
        return self.message_date
    }
    
    public func contact() -> Contact? {
        return self._contact
    }

    public func text() -> String? {
        return message_text ?? nil
    }
}
