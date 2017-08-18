import PackageDescription

let package = Package(
    name: "TelegramBot",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", majorVersion: 15),
        .Package(url: "https://github.com/IBM-Swift/Kitura-Request.git", majorVersion: 0)
    ]
)
