env=dev
run-debug-envless: bash scripts/fvm-run.sh flutter run
run-release-envless: bash scripts/fvm-run.sh flutter run --release

#Run on device
run-debug: env/.env.$(env)
	bash scripts/fvm-run.sh
	flutter run --flavor $(env) -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' env/.env.$(env))
run-release: env/.env.$(env)
	bash scripts/fvm-run.sh
	flutter run --flavor $(env) -t lib/main.dart --release $(shell awk '{print "--dart-define=" $$0}' env/.env.$(env))

#Build file (type= release)
build-apk: env/.env.$(env)
	bash scripts/fvm-run.sh
	flutter pub get
	flutter build apk --flavor $(env) -t lib/main.dart --release $(shell awk '{print "--dart-define=" $$0}' env/.env.$(env))
build-aab: env/.env.$(env)
	bash scripts/fvm-run.sh
	flutter pub get
	flutter build appbundle --flavor $(env) -t lib/main.dart --release $(shell awk '{print "--dart-define=" $$0}' env/.env.$(env))

build-ipa: env/.env.$(env)
	bash scripts/fvm-run.sh
	flutter pub get
	flutter build ios --flavor $(env) -t lib/main.dart --release $(shell awk '{print "--dart-define=" $$0}' env/.env.$(env))

#Deploy to app distribution
deploy-android: env/.env.$(env)
	bash scripts/fvm-run.sh
	ENVFILE=$(env) fastlane android deploy

deploy-ios: env/.env.$(env)
	bash scripts/fvm-run.sh
	ENVFILE=$(env) fastlane ios beta
