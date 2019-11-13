# Laravel install
install:
	@cp .env.example .env
	@docker-compose up -d
	@docker-compose exec php composer install
	@docker-compose exec php artisan key:generate