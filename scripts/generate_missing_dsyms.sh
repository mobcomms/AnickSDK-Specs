#!/bin/bash
# ============================================================
#  generate_missing_dsyms.sh — 임베드된 동적 프레임워크 중 dSYM 이 없는 것에 dSYM 을 만들어 준다
#
#  App Store 업로드 시 "Upload Symbols Failed — The archive did not include a dSYM for X.framework"
#  경고를 없앤다. 벤더가 dSYM 없이 배포하는 동적 프레임워크(AppLovinSDK · InMobiSDK · MolocoSDK ·
#  VungleAdsSDK · OpenWrapSDK · AdjustSigSdk 등)가 원인이다. AnickSDK 자체는 static 이라 앱 dSYM 에 포함된다.
#
#  만들어지는 dSYM 은 바이너리 UUID 만 맞춘 것이다(벤더가 디버그 정보를 주지 않으므로 그 벤더 코드의
#  크래시 심볼은 여전히 복원되지 않는다). 업로드 경고 제거와 크래시 리포트 UUID 매칭이 목적이다.
#
#  설정 (호스트 앱 타깃 → Build Phases → New Run Script Phase, 맨 마지막에 둔다)
#    "${BUILD_DIR%/Build/*}/SourcePackages/checkouts/AnickSDK-Specs/scripts/generate_missing_dsyms.sh"
#  - Build Settings 의 `User Script Sandboxing`(ENABLE_USER_SCRIPT_SANDBOXING) 을 NO 로 둔다.
#  - "Based on dependency analysis" 는 끈다.
#  - Release 구성(아카이브)에서만 동작한다.
# ============================================================
set -e

[ "${CONFIGURATION}" = "Release" ] || [ "${ACTION}" = "install" ] || exit 0

FW_DIR="${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
[ -d "$FW_DIR" ] || exit 0
mkdir -p "${DWARF_DSYM_FOLDER_PATH}"

for fw in "$FW_DIR"/*.framework; do
  [ -d "$fw" ] || continue
  exe=$(/usr/libexec/PlistBuddy -c "Print :CFBundleExecutable" "$fw/Info.plist" 2>/dev/null || basename "$fw" .framework)
  bin="$fw/$exe"
  dsym="${DWARF_DSYM_FOLDER_PATH}/$(basename "$fw").dSYM"
  [ -f "$bin" ] || continue
  [ -d "$dsym" ] && continue
  echo "generate_missing_dsyms: $(basename "$fw") → $(basename "$dsym")"
  xcrun dsymutil "$bin" -o "$dsym" 2>/dev/null || echo "warning: $(basename "$fw") dSYM 생성 실패" >&2
done
