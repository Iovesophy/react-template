.PHONY: install
install:
	docker compose run --rm node sh -c "npm install -g create-react-app && create-react-app react-sample"

.PHONY: start
start:
	docker compose up
