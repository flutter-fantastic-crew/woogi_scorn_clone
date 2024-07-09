# --delete-conflicting-outputs : 이전 빌드 때문에 패키지의 상반되는 충돌(g파일)이 생겼다고 가정하고, 제공되는 사용자 프롬프트 생략
# 이전 빌드 파일이 있고, 일반 빌드할 때 출동난다면 사용하기
build-run :
	dart run build_runner build --delete-conflicting-outputs

build-init :
	flutter clean && flutter pub get && dart run build_runner build --delete-conflicting-outputs