# Runs flake8 test on all files
lint:
	docker-compose run --rm app sh -c "flake8"

# Runs the unit test inside of the directory
test:
	docker-compose run --rm app sh -c "python manage.py test"

# Creates a project named 'app' in our parent directory noted by the dot character
# app will be placed in our existing app project /app/app
startproject:
	docker-compose run --rm app sh -c "django-admin startproject app ."

# Start services
up:
	docker-compose up

# Build our docker image
build:
	docker-compose build

.PHONY: lint test startproject up build
