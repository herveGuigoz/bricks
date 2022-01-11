.SILENT:

ENV = $(shell cat .env | grep '^[A-Z]' | perl -ne 'print "--dart-define $$_"')

.PHONY: generate
generate: ## update generated files
	flutter pub run build_runner build --delete-conflicting-outputs lib

.PHONY: run-dev
run-dev: ## run app with development flavor
	flutter run $(ENV) \
		--target lib/main_development.dart

.PHONY: run-production
run-production: ## run app with production flavor
	flutter run $(ENV) \
		--target lib/main_production.dart

.PHONY: run-release
run-release: ## run release app with production flavor
	flutter run $(ENV) \
		--release \
		--target lib/main_production.dart

.PHONY: build-appbundle
build-appbundle: ## build google play store app bundle
	flutter clean
	flutter build appbundle \
		--obfuscate \
		--split-debug-info=/android

.PHONY: build-ios
build-ios: ## build ios release
	flutter clean
	flutter build ios \
		--release \
		--flavor production \
		--target lib/main_production.dart
	flutter build ipa \
		--release \
		--flavor production \
		--target lib/main_production.dart
	open src/build/ios/archive/Runner.xcarchive

.PHONY: test
test: ## run unit tests
	melos run test

.PHONY: test-coverage
test-coverage: ## run unit tests with coverage
	flutter test --coverage --test-randomize-ordering-seed random
	genhtml -o coverage coverage/lcov.info
	open coverage/index.html

.PHONY: mirror
mirror: ## mirror screen read-only (using scrcpy)
	scrcpy -n -m 1024

.PHONY: record
record: ## record video (using scrcpy)
	scrcpy --record record.mp4

.PHONY: screenshot
screenshot: ## Capture screenshot
	adb exec-out screencap -p > ./screenshot.png

.PHONY: git-clean
git-clean: # Clean up git
	git clean -xffd

.DEFAULT_GOAL := help
.PHONY: help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'