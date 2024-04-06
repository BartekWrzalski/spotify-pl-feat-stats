build:
	bash ./scripts/build.sh

lint:
	docker run --env-file .env --user "1000:1000" --rm -v "$(shell pwd)":/app spotify-pl-feat-stats black .

run:
	docker run --env-file .env --user "1000:1000" --rm -v "$(shell pwd)":/app -p 8888:8888 spotify-pl-feat-stats jupyter lab --ip 0.0.0.0
