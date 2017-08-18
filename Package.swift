import PackageDescription

let package = Package(
    name: "TelegramBot",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", majorVersion: 15),
        .Package(url: "https://github.com/vapor/engine.git", majorVersion: 2, minor: 2)
    ]
)
