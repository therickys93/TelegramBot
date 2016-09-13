import SwiftyJSON
import Foundation
public class TelegramBot {

    private let token: String
    private var response = ""

    public class func parseUpdate(string: String) -> Update? {
        if let dataFromString = string.data(using: .utf8, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            // check the update_id 
            if let update_id = json["update_id"].int {
                // check the message
                if let message_id = json["message"]["message_id"].int {
                    if let date = json["message"]["date"].int {
                        if let text = json["message"]["text"].string {
                            // check the user
                            if let user_id = json["message"]["from"]["id"].int {
                                if let first_name = json["message"]["from"]["first_name"].string {
                                    // check the chat
                                    if let chat_id = json["message"]["chat"]["id"].int {
                                        if let type = json["message"]["chat"]["type"].string {
                                            let update = Update(id: update_id, message: Message(id: message_id, user: User(id: user_id, name: first_name), chat: Chat(id: chat_id, type: type), date: date, text: text))
                                            return update
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return nil
    }

    init(token: String) {
        self.token = token
    }

    func sendMessage(id: Int, text: String) -> String {
        let request = MakeRequest()
        let response = request.fetch("https://telegram-bot-api.herokuapp.com/api/" + self.token + "/" + String(id) + "/" + text)
        return response.response
    }

}