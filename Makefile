DATE=`date +%Y%m%d`
RVERSION=4.4.2
.PHONY: image

image: Dockerfile
	docker buildx \
		build \
		--platform linux/arm64 \
		-t jsleight1/example_database_shiny:R${RVERSION}-${DATE} \
		-t jsleight1/example_database_shiny:R${RVERSION}-latest \
		-f Dockerfile \
		--build-arg RVERSION=${RVERSION} \
		--push \
		.