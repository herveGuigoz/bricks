# Executables
FLUTTER	 = flutter
DART	 = dart
SCRCPY	 = scrcpy

# Misc
.DEFAULT_GOAL = help
.PHONY        : help build up start down logs sh composer vendor sf cc

## —— The Dart Makefile ——————————————————————————————————
help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9\./_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

## —— Flutter ————————————————————————————————————————————————————————————————
dependencies: ## Update dependencies
	@$(FLUTTER) pub get

format: ## Format code
	@$(FLUTTER) format

analyze: ## Analyze Dart code
	@$(FLUTTER) analyze .

test: ## Run all tests
	@$(FLUTTER) test --coverage --test-randomize-ordering-seed random --reporter expanded

devtools: ## Serving DevTools
	@$(FLUTTER) pub global run devtools

outdated: ## Check the version of packages
	@$(FLUTTER) pub outdated --color

run: ## Run application
	@$(FLUTTER) run --debug

generate: ## Generate code
	@$(FLUTTER) pub run build_runner build --delete-conflicting-outputs

## —— scrcpy  ——————————————————————————————————————————————————————————————
mirror: ## Mirror screen with scrcpy
	@$(SCRCPY) scrcpy --max-size 1024

record: ## Record screen with scrcpy
	@$(SCRCPY) scrcpy --max-size 1024 --record "$(shell date +%Y%m%d-%H%M%S).mp4"