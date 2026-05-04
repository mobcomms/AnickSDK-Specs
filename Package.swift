// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AnickSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AnickSDKFramework",
            targets: ["AnickSDKFramework"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "AnickSDKFramework",
            url: "https://github.com/mobcomms/AnickSDK-Specs/releases/download/2.0.10-beta.1/AnickSDKFramework.xcframework.zip",
            checksum: "b6e7f66da6745fd6570f87232151c25afc80d8835650689bd1a6da97199d4e5e"
        )
    ]
)
