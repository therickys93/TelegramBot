import XCTest
@testable import TelegramBot

class TelegramBotTests: XCTestCase {

    private var json = "{\"update_id\":10,\"message\":{\"message_id\":10,\"from\":{\"id\":10,\"first_name\":\"therickys93\",\"last_name\":\"Crippa\",\"username\":\"therickys93\"},\"chat\":{\"id\":12345678,\"first_name\":\"Riccardo\",\"last_name\":\"Crippa\",\"username\":\"therickys93\",\"type\":\"private\"},\"date\":12345678,\"text\":\"hello\"}}"
    
    private var jsonWithContact = "{\"update_id\":11,\"message\":{\"message_id\":11,\"from\":{\"id\":10,\"is_bot\":false,\"first_name\":\"Riccardo\",\"last_name\":\"Crippa\",\"username\":\"therickys93\",\"language_code\":\"en-US\"},\"chat\":{\"id\":12345678,\"first_name\":\"Riccardo\",\"last_name\":\"Crippa\",\"username\":\"therickys93\",\"type\":\"private\"},\"date\":1504883911,\"contact\":{\"phone_number\":\"+391234567890\",\"first_name\":\"best friend\",\"user_id\":12312}}}"
    
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
        XCTAssertEqual(10, update?.id)
    }

    func testThree() {
        let update = TelegramBot.parseUpdate(string: json)
        let message = Message(id: 10, user: User(id: 10, name: "therickys93"), chat: Chat(id: 12345678, type: "private"), date: 12345678, text: "hello", contact: nil)
        XCTAssertEqual(message.description, update?.message.description)
    }

    func testFinal() {
        let update = TelegramBot.parseUpdate(string: json)
        XCTAssertEqual(12345678, update?.message.chat.id)
        XCTAssertEqual("hello", update?.message.text)
        XCTAssertEqual("therickys93", update?.message.user.name)
    }
    
    func testWithContact() {
        let update = TelegramBot.parseUpdate(string: jsonWithContact)
        XCTAssertEqual(12345678, update?.message.chat.id)
        XCTAssertNil(update?.message.text)
    }
    
    func testGetContactInfo() {
        let update = TelegramBot.parseUpdate(string: jsonWithContact)
        XCTAssertEqual(12345678, update?.message.chat.id)
        XCTAssertEqual("best friend", update?.message.contact?.name)
        XCTAssertEqual("+391234567890", update?.message.contact?.telephone)
    }

    func testTelegramBotConstruct() {
        let _ = TelegramBot(token: "")
    }
    
    func testTelegramBotCreationOfUrl() {
        let bot = TelegramBot(token: "my-token")
        let getMe = bot.createUrlForRequest("getMe")
        XCTAssertEqual(getMe, "https://api.telegram.org/botmy-token/getMe")
        let sendMessage = bot.createUrlForRequest("sendMessage")
        XCTAssertEqual(sendMessage, "https://api.telegram.org/botmy-token/sendMessage")
    }

    func telegramBotSendMessage() {
        let bot = TelegramBot(token: "token")
        let response = bot.sendMessage(id: 12345678, text: "hello from TelegramBot")
        XCTAssertNotNil(response)
    }

    func telegramBotGetMe() {
        let bot = TelegramBot(token: "token")
        let response = bot.getMe()
        XCTAssertNotNil(response)
    }
    
    func telegramInTodo() {
        guard let token = Utils.tokenForKey("TELEGRAM_TOKEN") else {
            return
        }
        let update = TelegramBot.parseUpdate(string: json)
        let bot = TelegramBot(token: token)
        if let chat_id = update?.message.chat.id {
            if let text = update?.message.text {
                let response = bot.sendMessage(id: chat_id, text: text)
                XCTAssertNotNil(response)
            }
        }
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
            ("testTelegramBotCreationOfUrl", testTelegramBotCreationOfUrl),
            ("testWithContact", testWithContact),
            ("testGetContactInfo", testGetContactInfo),
        ]
    }
}
