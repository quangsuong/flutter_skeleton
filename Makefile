env=dev
run-debug-envless: bash scripts/fvm-run.sh flutter run
run-release-envless: bash scripts/fvm-run.sh flutter run --release
run-debug: env/.env.$(env)
	bash scripts/fvm-run.sh
	flutter run --flavor $(env) -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' env/.env.$(env))
run-release: env/.env.$(env)
	bash scripts/fvm-run.sh
	flutter run --flavor $(env) -t lib/main.dart --release $(shell awk '{print "--dart-define=" $$0}' env/.env.$(env))
