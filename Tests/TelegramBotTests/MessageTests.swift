import XCTest
@testable import TelegramBot

class MessageTests: XCTestCase {

    // User(id: 10, name: "therickys93")
    // Chat(id: 10, type: "private")

    func testConstruct() {
        let _ = Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello")
    }

    func testDescription() {
        let message = Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello")
        XCTAssertEqual("Message= id: 10, user: User= id: 10, first_name: therickys93, chat: Chat= id: 10, type: private, date: 12345678, text: hello", message.description)
    }

    func testId() {
        let message = Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello")
        XCTAssertEqual(10, message.id())
    }
    func testUser() {
        let message = Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello")
        XCTAssertEqual(User(id: 10, name: "therickys93").description, message.user().description)
    }
    func testChat() {
        let message = Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello")
        XCTAssertEqual(Chat(id: 10, type: "private").description, message.chat().description)
    }
    
    func testDate() {
       let message = Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello")
       XCTAssertEqual(12345678, message.date()) 
    }
    
    func testText() {
        let message = Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello")
        XCTAssertEqual("hello", message.text())
    }
    
    static var allTests : [(String, (MessageTests) -> () throws -> Void)] {
        return [
            ("testConstruct", testConstruct),
            ("testDescription", testDescription),
            ("testId", testId),
            ("testUser", testUser),
            ("testChat", testChat),
            ("testDate", testDate),
            ("testText", testText)
        ]
    }
}