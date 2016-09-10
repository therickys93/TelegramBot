import XCTest
@testable import TelegramBot

class ChatTests: XCTestCase {

    func testConstruct() {
        let _ = Chat(id: 10, type: "private")
    }

    func testDescription() {
        let chat = Chat(id: 10, type: "private")
        XCTAssertEqual("Chat= id: 10, type: private", chat.description)
    }

    func testId() {
        let chat = Chat(id: 10, type: "private")
        XCTAssertEqual(10, chat.id())
    }

    func testType() {
        let chat = Chat(id: 10, type: "private")
        XCTAssertEqual("private", chat.type())
    }

    static var allTests : [(String, (ChatTests) -> () throws -> Void)] {
        return [
            ("testConstruct", testConstruct),
            ("testId", testId),
            ("testDescription", testDescription),
            ("testType", testType)
        ]
    }
}