# Laravel install
install:
	@cp .env.example .env
	@docker-compose up -d
	@docker-compose run --rm composer install