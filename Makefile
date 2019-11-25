DC=docker-compose
STAGE=local
build:
	@$(DC) build
build_nc:
	@$(DC) build --no-cache
up:
	@$(DC) up -d
down:
	@$(DC) down
restart:
	@$(DC) restart
reload:
	@$(DC) down
	@$(DC) up -d
ps:
	@$(DC) ps
exec:
	@$(DC) exec $(NAME) bash

install:
	@cp .env.$(STAGE) .env
	@$(DC) up -d
	@make composer C="install"
	@make artisan_ C="key:generate"
	@make npm C="install"
	@make npm_run_dev

artisan_:
	@$(DC) exec php php artisan $(C)

composer:
	@$(DC) exec php composer $(C)

phpunit:
	@$(DC) exec php ./vendor/bin/phpunit $(C)

npm:
	@$(DC) exec php npm $(C)

npm_run_dev:
	@make npm C="run dev"
