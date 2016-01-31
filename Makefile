################################################################################

all: avr-sdk

avr-sdk: avr-sdk/.done
release: sdk-release

################################################################################

avr-sdk/.done: avr-sdk/Dockerfile
	-docker rmi raphaelmeyer/avr-sdk
	docker build -t raphaelmeyer/avr-sdk avr-sdk
	touch $@

################################################################################

sdk-release: check-tag avr-sdk
	echo docker tag raphaelmeyer/avr-sdk raphaelmeyer/avr-sdk:$(tag)
	echo docker push raphaelmeyer/avr-sdk:$(tag)

check-tag:
ifndef tag
	$(error "Must specify a tag with make release tag=TAG")
endif

################################################################################

clean:
	rm -rf avr-sdk/.done
	-docker rmi raphaelmeyer/avr-sdk

.PHONY: clean

