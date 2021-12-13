APP:=react-sample
BUCKET:=react-sample-$(shell date "+%Y%m%d-%H%M%S")
BUCKET_RM:=

all: run appbuild deploy

.PHONY: appbuild
appbuild:
	docker compose up appbuild

.PHONY: run
run: build
	docker compose run --rm node sh -c "npm install -g create-react-app && create-react-app $(APP)"

.PHONY: run-ts
run-ts: build
	docker compose run --rm node sh -c "npm install -g create-react-app && create-react-app $(APP) --template typescript"

.PHONY: build
build:
	docker compose build

.PHONY: up
up:
	docker compose up node

.PHONY: deploy
deploy:
	./cloudformation.sh deploy $(BUCKET)

.PHONY: remove
remove:
	./cloudformation.sh remove $(BUCKET_RM)
