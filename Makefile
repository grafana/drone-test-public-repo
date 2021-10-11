.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: .drone.yml
.drone.yml: ## Lint and sign .drone.yml pipeline file
	drone lint .drone.yml
	drone sign --save grafana/drone-test-public-repo .drone.yml
