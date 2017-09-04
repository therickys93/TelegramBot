import XCTest
@testable import TelegramBot

class CommandParserTests: XCTestCase {
    
    func testConstruct() {
        let _ = CommandParser("")
    }
    
    func testPassingNil() {
        let _ = CommandParser(nil)
    }
    
    func testNilResult() {
        let parser = CommandParser(nil)
        XCTAssertEqual("", parser.command)
        XCTAssertEqual("", parser.argument)
    }
    
    func testCommand() {
        let parser = CommandParser("/start start")
        XCTAssertEqual("/start", parser.command)
        XCTAssertEqual("start", parser.argument)
    }
    
    func testSimple() {
        let parser = CommandParser("/start")
        XCTAssertEqual("/start", parser.command)
        XCTAssertEqual("", parser.argument)
    }
    
    func testVeryLongCommand() {
        let parser = CommandParser("/command very long long command to parse")
        XCTAssertEqual("/command", parser.command)
        XCTAssertEqual("very long long command to parse", parser.argument)
    }
    
    static var allTests : [(String, (CommandParserTests) -> () throws -> Void)] {
        return [
            ("testConstruct", testConstruct),
            ("testPassingNil", testPassingNil),
            ("testNilResult", testNilResult),
            ("testCommand", testCommand),
            ("testSimple", testSimple),
            ("testVeryLongCommand", testVeryLongCommand),
        ]
    }
}
