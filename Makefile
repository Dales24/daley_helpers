.DEFAULT_GOAL := help

.PHONY: help test lint fmt tf-plan docker-build

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}'

test: ## Run the test suite
	pytest -q testing/

lint: ## Lint python + shell
	flake8 python/ algos/ testing/
	shellcheck scripts/*.sh aws/*.sh

fmt: ## Auto-format python
	black python/ algos/ testing/

tf-plan: ## Terraform plan
	cd terraform && terraform init && terraform plan

docker-build: ## Build the docker image
	docker build -t daley_helpers:local docker/
