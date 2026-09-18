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
            url: "https://github.com/mobcomms/AnickSDK-Specs/releases/download/2.0.13/AnickSDKFramework.xcframework.zip",
            checksum: "7dabda693b5dd6f117efddc81aff7fab8c7ea56c6307fc9313745fbb2bad9075"
        ),
        .binaryTarget(
            name: "AnickSDKFrameworkBinary_Happypoint",
            url: "https://github.com/mobcomms/AnickSDK-Specs/releases/download/2.0.13/AnickSDKFramework_happypoint.xcframework.zip",
            checksum: "741f186b632478dab856db53f0816f4e728afffc66072a99da05236cfcddd19a"
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
