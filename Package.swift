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
            url: "https://github.com/mobcomms/AnickSDK-Specs/releases/download/2.0.12/AnickSDKFramework.xcframework.zip",
            checksum: "7c2d1f89cd699a58b6d05f4f5e15e82f3cdf620c85708e14471bb7783b31e92c"
        ),
        .binaryTarget(
            name: "AnickSDKFrameworkBinary_Happypoint",
            url: "https://github.com/mobcomms/AnickSDK-Specs/releases/download/2.0.12/AnickSDKFramework_happypoint.xcframework.zip",
            checksum: "f488b38274ebdd29cba2d085e19e1f4720132875d46064be9a00b12b5edf6121"
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
