run:
	docker compose -f ./deploy/docker-compose.yml up -d

down:
	docker compose -f ./deploy/docker-compose.yml down --remove-orphans

base:
	docker build -t base_users -f ./deploy/users/Dockerfile.base ./services/backend/users/
	docker build -t base_frontend -f ./deploy/frontend/Dockerfile.base ./services/frontend/QSS/

build:
	docker compose -f ./deploy/docker-compose.yml build

launch:
	if docker exec -i postgres psql -U postgres -d postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'qss_db'" | grep -q 1; then \
		echo "baza istnieje"; \
	else \
		docker exec -i postgres psql -q -U postgres -d postgres -c "CREATE DATABASE qss_db;"; \
		echo "baza utworzona"; \
		docker exec -i postgres psql -q -U postgres -d qss_db < qss_db.sql; \
		echo "baza wczytana"; \
	fi


first: base build run launch restart

restart:
	$(MAKE) down
	$(MAKE) run
