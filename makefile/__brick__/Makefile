# Executables
{{#docker}}
DOCKER_COMP = docker compose
{{/docker}}
{{#flutter}}
FLUTTER	 	= flutter
DART	 	= dart
SCRCPY	 	= scrcpy
{{/flutter}}
{{#symfony}}
PHP_CONT = $(DOCKER_COMP) exec php
PHP      = $(PHP_CONT) php
COMPOSER = $(PHP_CONT) composer
SYMFONY  = $(PHP) bin/console
{{/symfony}}
{{#docker}}
# Variables
SERVICE ?= $(shell bash -c 'read -p "Service: " service; echo $$service')
{{/docker}}

# Misc
.DEFAULT_GOAL = help
.PHONY        : help {{#docker}}build up down reset recreate logs sh{{/docker}}{{#flutter}}dependencies format analyze test devtools outdated run generate mirror record{{/flutter}}{{#symfony}} composer vendor sf cc{{/symfony}}

{{#docker}}
## —— Docker ————————————————————————————————————————————————————————————————
build: ## Builds the Docker images
	@$(DOCKER_COMP) build --pull --no-cache

up: ## Start the docker hub in detached mode (no logs)
	@$(DOCKER_COMP) up --detach

down: ## Stop the docker hub
	@$(DOCKER_COMP) down --remove-orphans

reset: ## Stops the docker hub and deletes all its data including all images
	@$(DOCKER_COMP) down --remove-orphans --volumes --rmi all

recreate: ## Recreate a service
	@$(DOCKER_COMP) up --detach --force-recreate --no-deps $(SERVICE)

logs: ## Show live logs
	@$(DOCKER_COMP) logs --tail=0 --follow

sh: ## Connect to the service container
	@$(DOCKER_COMP) exec $(SERVICE) sh
{{/docker}}

{{#flutter}}
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
{{/flutter}}

{{#symfony}}
## —— Composer ——————————————————————————————————————————————————————————————
composer: ## Run composer, pass the parameter "c=" to run a given command, example: make composer c='req symfony/orm-pack'
	@$(eval c ?=)
	@$(COMPOSER) $(c)

vendor: ## Install vendors according to the current composer.lock file
vendor: c=install --prefer-dist --no-dev --no-progress --no-scripts --no-interaction
vendor: composer

## —— Symfony ———————————————————————————————————————————————————————————————
sf: ## List all Symfony commands or pass the parameter "c=" to run a given command, example: make sf c=about
	@$(eval c ?=)
	@$(SYMFONY) $(c)

cc: c=c:c ## Clear the cache
cc: sf
{{/symfony}}