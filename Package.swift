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
        .package(url: "https://github.com/bytedance/AdsGlobalPackage", exact: "8.2.1-release.2"),
    ],
    targets: [
        .binaryTarget(
            name: "AnickSDKFramework",
            url: "https://github.com/mobcomms/AnickSDK-Specs/releases/download/2.0.15-happypoint/AnickSDKFramework.xcframework.zip",
            checksum: "987b6751b25fc177939e8a28c5c73a2935909e6836b271784afca876a95bac8c"
        ),
        .binaryTarget(
            name: "AnickSDKFrameworkBinary_Happypoint",
            url: "https://github.com/mobcomms/AnickSDK-Specs/releases/download/2.0.15-happypoint/AnickSDKFramework_happypoint.xcframework.zip",
            checksum: "bc821e06c5ea14607a2646649d5281a77dabbdf0d0bf7f60358747384078d6ca"
        ),
        .target(
            name: "AnickSDKFramework_Happypoint",
            dependencies: [
                .target(name: "AnickSDKFrameworkBinary_Happypoint"),
                .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage"),
            ],
            resources: [.process("Resources")]
        ),
    ]
)
