Pod::Spec.new do |s|
  s.name             = 'AnickSDKFramework'
  s.version          = '2.0.10-beta.1'
  s.summary          = 'Anick iOS SDK 프레임워크'
  s.description      = <<-DESC
    AnickSDK는 다양한 매체사를 위한 광고 iOS SDK입니다.
    Core 기능에 더해 DaroAds, ADXLibrary 광고 어댑터를 선택적으로 포함할 수 있습니다.
  DESC

  s.homepage         = 'https://www.anick.io/'
  s.license          = { :type => 'Proprietary' }
  s.author           = { 'Anick' => 'khkim@anick.io' }
  s.source           = {
    :git => 'https://github.com/mobcomms/AnickSDK-iOS.git',
    :tag => s.version.to_s
  }

  s.ios.deployment_target = '13.0'
  s.swift_versions        = ['5.0']
  s.static_framework      = true

  s.pod_target_xcconfig = {
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
  }

  s.default_subspecs = ['Core']

  # ────────────────────────────────────────
  # Core subspec (기본 포함)
  # ────────────────────────────────────────
  s.subspec 'Core' do |core|
    core.source_files = [
      'Sources/Common/**/*.{swift,h,m}',
      'Sources/Foundation/**/*.{swift,h,m}',
      'Modules/AnickCore/Sources/**/*.{swift,h,m}',
    ]

    core.exclude_files = [
      'Modules/AnickCore/Sources/Foundation/Extension/Bundle+Extension.swift',
      'Modules/AnickCore/Sources/Foundation/Extension/Color+Extension.swift',
      'Modules/AnickCore/Sources/Foundation/Extension/String+Extension.swift',
    ]

    core.resource_bundles = {
      'AnickSDKFramework' => [
        'Resources/Assets.xcassets',
        'Resources/PrivacyInfo.xcprivacy',
        'Resources/Pretendard-Bold.otf',
        'Resources/Pretendard-Regular.otf',
        'Resources/SpoqaHanSansNeo-Bold.otf',
      ]
    }

    core.frameworks = 'UIKit', 'WebKit', 'Foundation', 'SwiftUI', 'SystemConfiguration'
  end

  # ────────────────────────────────────────
  # Daro subspec (선택)
  # ────────────────────────────────────────
  s.subspec 'Daro' do |daro|
    daro.source_files = 'Sources/Feature/Daro/**/*.{swift,h,m}'

    daro.dependency 'AnickSDKFramework/Core'
    daro.dependency 'DaroAds'

    daro.pod_target_xcconfig = {
      'SWIFT_ACTIVE_COMPILATION_CONDITIONS' => '$(inherited) DARO',
    }
  end

  # ────────────────────────────────────────
  # ADX subspec (선택)
  # ────────────────────────────────────────
  s.subspec 'ADX' do |adx|
    adx.source_files = 'Sources/Feature/ADX/**/*.{swift,h,m}'

    adx.dependency 'AnickSDKFramework/Core'
    adx.dependency 'ADXLibrary', '2.8.4'

    adx.pod_target_xcconfig = {
      'SWIFT_ACTIVE_COMPILATION_CONDITIONS' => '$(inherited) ADX',
    }
  end

end
