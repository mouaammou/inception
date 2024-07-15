# Variables
DOCKER_COMPOSE = docker-compose
COMPOSE_FILE = docker-compose.yml
PROJECT_DIR = srcs

# Default target
all: build up

# Build the Docker images
build:
	@echo "Building Docker images..."
	@$(DOCKER_COMPOSE) -f $(PROJECT_DIR)/$(COMPOSE_FILE) build

# Start the Docker Compose services
up:
	@echo "Starting Docker Compose services..."
	@$(DOCKER_COMPOSE) -f $(PROJECT_DIR)/$(COMPOSE_FILE) up -d --build

# Stop the Docker Compose services
down:
	@echo "Stopping Docker Compose services..."
	@$(DOCKER_COMPOSE) -f $(PROJECT_DIR)/$(COMPOSE_FILE) down

# Stop and remove all containers, networks, and volumes
clean:
	@echo "Stopping and removing all containers, networks, and volumes..."
	@$(DOCKER_COMPOSE) -f $(PROJECT_DIR)/$(COMPOSE_FILE) down -v --remove-orphans

# Restart the Docker Compose services
restart: down up

# View logs from the Docker Compose services
logs:
	@$(DOCKER_COMPOSE) -f $(PROJECT_DIR)/$(COMPOSE_FILE) logs -f

# Remove unused Docker data
prune:
	@echo "Removing unused Docker data..."
	@docker system prune -f

# List running containers
ps:
	@$(DOCKER_COMPOSE) -f $(PROJECT_DIR)/$(COMPOSE_FILE) ps

# Help target
help:
	@echo "Available targets:"
	@echo "  build    - Build the Docker images"
	@echo "  up       - Start the Docker Compose services"
	@echo "  down     - Stop the Docker Compose services"
	@echo "  clean    - Stop and remove all containers, networks, and volumes"
	@echo "  restart  - Restart the Docker Compose services"
	@echo "  logs     - View logs from the Docker Compose services"
	@echo "  prune    - Remove unused Docker data"
	@echo "  ps       - List running containers"
	@echo "  help     - Display this help message"
