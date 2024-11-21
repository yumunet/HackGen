.PHONY: build-image
build-image:
	docker compose build

.PHONY: run
run:
	docker compose run --rm main $(CMD)

.PHONY: build
build:
	@make run CMD=./make_hackgen.sh

.PHONY: pack
pack:
	@make run CMD=./pack.sh

.PHONY: build+pack
build+pack:
	@make run CMD="bash -c \"./make_hackgen.sh && ./pack.sh\""
