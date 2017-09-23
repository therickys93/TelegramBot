import XCTest
@testable import TelegramBot

class UserTests: XCTestCase {
    func testConstruct() {
        let _ = User(id: 10, name: "therickys93")
    }

    func testDescription() {
        let user = User(id: 10, name: "therickys93")
        XCTAssertEqual("User= id: 10, first_name: therickys93", user.description)
    }

    func testName() {
        let user = User(id: 10, name: "therickys93")
        XCTAssertEqual("therickys93", user.name)
    }

    func testId() {
        let user = User(id: 10, name: "therickys93")
        XCTAssertEqual(10, user.id)
    }

    static var allTests : [(String, (UserTests) -> () throws -> Void)] {
        return [
            ("testConstruct", testConstruct),
            ("testDescription", testDescription),
            ("testName", testName),
            ("testId", testId)
        ]
    }
}
