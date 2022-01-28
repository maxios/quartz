.DEFAULT_GOAL := serve

help: ## Show all Makefile targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

serve: ## serve
	hugo server

build: ## serve
	ls $(GOPATH) && go install github.com/jackyzha0/hugo-obsidian@latest && $(GOPATH)/bin/hugo-obsidian -input=content -output=data -index -root=. && hugo

start: ## serve
	make build && make serve
