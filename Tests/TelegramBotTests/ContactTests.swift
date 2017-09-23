import XCTest
@testable import TelegramBot

class ContactTests: XCTestCase {
    
    func testConstruct() {
        let _ = Contact(name: "Riccardo", telephone: "1234567890")
    }
    
    func testDescription() {
        let contact = Contact(name: "Riccardo", telephone: "1234567890")
        XCTAssertEqual("Contact= name:Riccardo, telephone:1234567890", contact.description)
    }
    
    func testName() {
        let contact = Contact(name: "Riccardo", telephone: "1234567890")
        XCTAssertEqual("Riccardo", contact.name)
    }
    
    func testType() {
        let contact = Contact(name: "Riccardo", telephone: "1234567890")
        XCTAssertEqual("1234567890", contact.telephone)
    }
    
    static var allTests : [(String, (ContactTests) -> () throws -> Void)] {
        return [
            ("testConstruct", testConstruct),
            ("testName", testName),
            ("testDescription", testDescription),
            ("testType", testType)
        ]
    }
}
