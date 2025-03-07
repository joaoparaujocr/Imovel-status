DOCKER_NAME_BACKEND=backend_imovel_status
DOCKER_NAME_FRONTEND=frontend_imovel_status
DOCKER_COMPOSE?=docker-compose

.PHONY: build install dev up start first stop restart clear


up:
	$(DOCKER_COMPOSE) up

stop: 
	$(DOCKER_COMPOSE) stop

build: 
	$(DOCKER_COMPOSE) build

create-env:
	echo "POSTGRES_USER=imovel" > .env
	echo "POSTGRES_PASSWORD=1234" >> .env
	echo "POSTGRES_DB=imovel_db" >> .env
	echo "SECRET_KEY=secret" >> .env

migration:
	docker exec -it $(DOCKER_NAME_BACKEND) /bin/bash -c "pnpm run migration:run"

bash-back:
	docker exec -it $(DOCKER_NAME_BACKEND) /bin/bash

bash-front:
	docker exec -it $(DOCKER_NAME_FRONTEND) /bin/bash