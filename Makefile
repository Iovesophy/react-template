.PHONY: install
install: build
	docker compose run --rm node sh -c "npm install -g create-react-app && create-react-app react-sample"

.PHONY: build
build:
	docker compose build

.PHONY: start
start:
	docker compose up
