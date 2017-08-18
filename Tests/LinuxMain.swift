import XCTest
@testable import TelegramBotTests

XCTMain([
     testCase(TelegramBotTests.allTests),
     testCase(UserTests.allTests),
     testCase(ChatTests.allTests),
     testCase(MessageTests.allTests),
     testCase(UpdateTests.allTests),
])
