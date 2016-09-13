import XCTest
@testable import TelegramBot

class MakeRequestTests: XCTestCase {

    let client = MakeRequest()
    let response = "{\"code\":\"IT\",\"fire\":\"115\",\"police\":\"113\",\"name\":\"Italy\",\"medical\":\"118\"}"

    func testContruct() {
        let _ = MakeRequest()
    }

    func testGetOverHTTP() {
        let result = client.fetch("http://emergency-phone-numbers.herokuapp.com/country/it")
        XCTAssertEqual(result.responseCode, "200", "Incorrect response code received from server")
        print(result.response)
        XCTAssertEqual(result.response, response, "Incorrect response string received from server")
    }

    func testGetOverHTTPS() {
        let result = client.fetch("https://emergency-phone-numbers.herokuapp.com/country/it")
        XCTAssertEqual(result.responseCode, "200")
        print(result.response)
        XCTAssertEqual(result.response, response)
    }

    static var allTests : [(String, (MakeRequestTests) -> () throws -> Void)] {
        return [
            ("testContruct", testContruct),
            ("testGetOverHTTP", testGetOverHTTP),
            ("testGetOverHTTPS", testGetOverHTTPS),
        ]
    }

}