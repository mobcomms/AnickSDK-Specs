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
        .library(
            name: "AnickSDKFramework_Happypoint",
            targets: ["AnickSDKFramework_Happypoint"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/bytedance/AdsGlobalPackage", exact: "8.1.0-release.9"),
    ],
    targets: [
        .binaryTarget(
            name: "AnickSDKFramework",
            url: "https://github.com/mobcomms/AnickSDK-Specs/releases/download/2.0.14/AnickSDKFramework.xcframework.zip",
            checksum: "28f749d9088403d0b15032cb933bdd8e71acc6fbe7e384f4e55462ddb63a8bd3"
        ),
        .binaryTarget(
            name: "AnickSDKFrameworkBinary_Happypoint",
            url: "https://github.com/mobcomms/AnickSDK-Specs/releases/download/2.0.14/AnickSDKFramework_happypoint.xcframework.zip",
            checksum: "64ad1ddf37909976b4941090df17f7c1e8e532afd4547c67f3d6a3926741c158"
        ),
        .target(
            name: "AnickSDKFramework_Happypoint",
            dependencies: [
                .target(name: "AnickSDKFrameworkBinary_Happypoint"),
                .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage"),
            ]
        ),
    ]
)
