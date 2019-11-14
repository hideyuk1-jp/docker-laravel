DC=docker-compose
build:
	@$(DC) build
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
	@cp .env.example .env
	@$(DC) up -d
	@make composer C="install"
	@make artisan_ C="key:generate"

artisan_:
	@$(DC) exec php php artisan $(C)

composer:
	@$(DC) exec php composer $(C)
