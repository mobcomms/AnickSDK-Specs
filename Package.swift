// swift-tools-version: 5.9
//
// AnickSDK 2.2.03 — KGMobilians 전용 배포 브랜치 `kgmobilians`
// ⚠️ 자동 생성 파일 — AnickSDK-iOS 의 scripts/gen_package_swift.sh 가 만든다. 직접 수정하지 말 것.

import PackageDescription

let package = Package(
    name: "AnickSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "AnickSDKFramework_KGMobilians", targets: ["AnickSDKFramework_KGMobilians"]),
    ],
    dependencies: [
        .package(url: "https://github.com/delightroom/daro-ios-sdk.git", exact: "2.0.1"),
    ],
    targets: [
        .binaryTarget(
            name: "AnickSDKFrameworkBinary_KGMobilians",
            url: "https://github.com/mobcomms/AnickSDK-Specs/releases/download/2.2.03-kgmobilians/AnickSDKFrameworkBinary_KGMobilians.xcframework.zip",
            checksum: "841165438b863f80185adcaf8823da236a9923b868a2d6e53aed6b19b0e15efb"
        ),
        // wrapper — static 바이너리 + 벤더 패키지 + SDK 리소스를 한 product 로 묶는다
        .target(
            name: "AnickSDKFramework_KGMobilians",
            dependencies: [
                .target(name: "AnickSDKFrameworkBinary_KGMobilians"),
                .product(name: "DaroAds", package: "daro-ios-sdk"),
            ],
            resources: [
                .copy("Resources/AnickSDKFramework-Info.plist"),
                .copy("Resources/Assets.car"),
                .copy("Resources/DynamicLoading.html"),
                .copy("Resources/LottieLoading.html"),
                .copy("Resources/LottieLoadingData.js"),
                .copy("Resources/PrivacyInfo.xcprivacy"),
                .copy("Resources/eruda-LICENSE.txt"),
                .copy("Resources/eruda.js"),
                .copy("Resources/lottie-LICENSE.txt"),
                .copy("Resources/lottie_light.min.js"),
            ]
        ),
    ]
)
