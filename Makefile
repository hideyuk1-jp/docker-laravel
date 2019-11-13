# Laravel install
install:
	@cp .env.example .env
	@docker-compose up -d
	@docker-compose exec -it php composer install
	@docker-compose exec -it php artisan key:generate