import XCTest
@testable import TelegramBot

class TelegramBotTests: XCTestCase {

    private var json = "{\"update_id\":10,\"message\":{\"message_id\":10,\"from\":{\"id\":10,\"first_name\":\"therickys93\",\"last_name\":\"Crippa\",\"username\":\"therickys93\"},\"chat\":{\"id\":10,\"first_name\":\"Riccardo\",\"last_name\":\"Crippa\",\"username\":\"therickys93\",\"type\":\"private\"},\"date\":12345678,\"text\":\"hello\"}}"

    func testExample() {
        let _ = TelegramBot.parseUpdate(string: "")
    }

    func testNoString() {
        XCTAssertNil(TelegramBot.parseUpdate(string: "")) 
    }

    func testOne() {
        let update = TelegramBot.parseUpdate(string: json)
        XCTAssertNotNil(update)
    }

    func testTwo() {
        let update = TelegramBot.parseUpdate(string: json)
        XCTAssertEqual(10, update?.id())
    }

    func testThree() {
        let update = TelegramBot.parseUpdate(string: json)
        let message = Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 10, type: "private"), date: 12345678, text: "hello")
        XCTAssertEqual(message.description, update?.message().description)
    }

    func testFinal() {
        let update = TelegramBot.parseUpdate(string: json)
        XCTAssertEqual(10, update?.message().chat().id())
        XCTAssertEqual("hello", update?.message().text())
        XCTAssertEqual("therickys93", update?.message().user().name())
    }

    func testTelegramBotConstruct() {
        let _ = TelegramBot(token: "")
    }

    func testTelegramBotSendMessage() {
        // use it in the bot
        // this version use the https://telegram-bot-api.herokuapp.com/api
        let bot = TelegramBot(token: "token")
        let _ = bot.sendMessage(id: 12345678, text: "hello")
    }

    func testTelegramBotGetMe() {
        let bot = TelegramBot(token: "token")
        let _ = bot.getMe()
    }

    static var allTests : [(String, (TelegramBotTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
            ("testNoString", testNoString),
            ("testOne", testOne),
            ("testTwo", testTwo),
            ("testThree", testThree),
            ("testFinal", testFinal),
            ("testTelegramBotConstruct", testTelegramBotConstruct),
            ("testTelegramBotSendMessage", testTelegramBotSendMessage),
            ("testTelegramBotGetMe", testTelegramBotGetMe)
        ]
    }
}
