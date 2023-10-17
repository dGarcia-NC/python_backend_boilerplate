# Runs flake8 test on all files
flake8:
	docker-compose run --rm app sh -c "flake8"

# Creates a project named 'app' in our parent directory noted by the dot character
# app will be placed in our existing app project /app/app
startproject:
	docker-compose run --rm app sh -c "django-admin startproject app ."

# Start services
up:
	docker-compose up

.PHONY: flake8 startproject up
