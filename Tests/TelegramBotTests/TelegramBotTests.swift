import XCTest
@testable import TelegramBot

class TelegramBotTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(TelegramBot().text, "Hello, World!")
    }


    static var allTests : [(String, (TelegramBotTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
