COMPOSE_FILE = srcs/docker-compose.yml

all: build up

build:
	@docker-compose -f $(COMPOSE_FILE) build

up:
	@docker-compose -f $(COMPOSE_FILE) up -d

start :
	@docker-compose -f $(COMPOSE_FILE) start

stop :
	@docker-compose -f $(COMPOSE_FILE) stop

down:
	@docker-compose -f $(COMPOSE_FILE) down

clean: down
	@docker system prune -af --volumes

re: down up

logs:
	@docker-compose -f $(COMPOSE_FILE) logs -f

net:
	@docker network ls

volume:
	@docker volume ls

ps:
	@docker-compose -f $(COMPOSE_FILE) ps

help:
	@echo "Available targets:"
	@echo "  build    - Build the Docker images"
	@echo "  up       - Start the Docker Compose services"
	@echo "  start    - Start stopped Docker Compose services"
	@echo "  stop     - Stop the Docker Compose services"
	@echo "  down     - Stop and remove the Docker Compose services"
	@echo "  clean    - Remove unused Docker data"
	@echo "  re       - Restart the Docker Compose services"
	@echo "  logs     - View logs from the Docker Compose services"
	@echo "  net      - List Docker networks"
	@echo "  volume   - List Docker volumes"
	@echo "  ps       - List running containers"

.PHONY: build up start stop down clean re logs net volume ps
