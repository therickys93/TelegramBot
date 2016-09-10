import PackageDescription

let package = Package(
    name: "TelegramBot",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", majorVersion: 14)
    ]
)
