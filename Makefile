DC=docker-compose
# Laravel install
install:
	@cp .env.example .env
	@$(DC) up -d
	@make composer C="install"
	@make artisan_ C="key:generate"

artisan_:
	@$(DC) exec php php artisan $(C)

composer:
	@$(DC) exec php composer $(C)
