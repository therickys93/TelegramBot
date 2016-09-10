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
        /* not already implemented for linux
        var request = URLRequest(url: URL(string: "https://api.telegram.org/bot" + self.token + "/sendMessage")!)
        request.httpMethod = "POST"
        let postString = "chat_id=" + String(id) + "&text=" + text
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(error)")
                return
            }

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }

            if let responseString = String(data: data, encoding: .utf8) {
                print("responseString = \(responseString)")
                self.response = responseString
            }
        }
        task.resume()
        return self.response
        */
        return "method not implemented yet"
    }

}