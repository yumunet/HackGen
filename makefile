.PHONY: build-image
build-image:
	docker compose build

.PHONY: run
run:
	docker compose run --rm main $(CMD)

.PHONY: build
build:
	@make run CMD=./make_hackgen.sh
