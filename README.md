# AnickSDK — KGMobilians

```swift
.package(url: "https://github.com/mobcomms/AnickSDK-Specs", exact: "2.2.3-kgmobilians")
.product(name: "AnickSDKFramework_KGMobilians", package: "AnickSDK-Specs")
```

- 현재 버전: **2.2.03** (릴리즈: [2.2.3-kgmobilians](https://github.com/mobcomms/AnickSDK-Specs/releases/tag/2.2.3-kgmobilians))
- Xcode: Dependency Rule **Exact Version** → `2.2.3-kgmobilians` (범위 규칙은 다른 매체사 태그를 고를 수 있어 쓰지 않는다)
- 최신 배포를 계속 따라가기: `branch: "kgmobilians"`
- 연동 가이드: AnickSDK 연동 가이드 문서 참고
- dSYM 경고(Upload Symbols Failed) 대응: 앱 타깃 Run Script 에
  `"${BUILD_DIR%/Build/*}/SourcePackages/checkouts/AnickSDK-Specs/scripts/generate_missing_dsyms.sh"`
