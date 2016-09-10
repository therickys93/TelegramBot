import XCTest
@testable import TelegramBot

class UpdateTests: XCTestCase {

    func testConstruct() {
        let _ = Update(id: 10, message: Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello"))
    }

    func testDescription() {
        let update = Update(id: 10, message: Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello"))
        XCTAssertEqual("Update= id: 10, message: Message= id: 10, user: User= id: 10, first_name: therickys93, chat: Chat= id: 10, type: private, date: 12345678, text: hello", update.description)
    }

    func testId() {
        let update = Update(id: 10, message: Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello"))
        XCTAssertEqual(10, update.id())
    }

    func testMessage() {
        let update = Update(id: 10, message: Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello"))
        XCTAssertEqual(Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello").description, update.message().description)
    }

    static var allTests : [(String, (UpdateTests) -> () throws -> Void)] {
        return [
            ("testConstruct", testConstruct),
            ("testDescription", testDescription),
            ("testId", testId),
            ("testMessage", testMessage)
        ]
    }
}