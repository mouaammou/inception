COMPOSE_FILE = srcs/docker-compose.yml

all: build up

build:
	@docker-compose -f $(COMPOSE_FILE) build

up:
	@docker-compose -f $(COMPOSE_FILE) up -d

rebuild:
	@docker-compose -f $(COMPOSE_FILE) build --no-cache

down:
	@docker-compose -f $(COMPOSE_FILE) down

clean: down
	@docker system prune -af --volumes

re: down up

logs:
	@docker-compose -f $(COMPOSE_FILE) logs -f

ps:
	@docker-compose -f $(COMPOSE_FILE) ps

help:
	@echo "  build    - Build the Docker images"
	@echo "  up       - Start the Docker Compose services"
	@echo "  down     - Stop the Docker Compose services"
	@echo "  re  	  - Restart the Docker Compose services"
	@echo "  logs     - View logs from the Docker Compose services"
	@echo "  prune    - Remove unused Docker data"
	@echo "  ps       - List running containers"
	@echo "  help     - Display this help message"
