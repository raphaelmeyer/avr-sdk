################################################################################

all: avr-sdk

################################################################################

makepath = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

################################################################################

avr-sdk: avr-sdk/.done
avr-base: avr-base/.done

################################################################################

avr-base/.done: avr-base/Dockerfile
	docker build -t raphaelmeyer/avr-base avr-base
	touch $@

avr-sdk/.done: avr-base avr-sdk/Dockerfile
	docker build -t raphaelmeyer/avr-sdk avr-sdk
	touch $@

################################################################################

clean:
	-docker rmi raphaelmeyer/avr-sdk
	rm -rf avr-sdk/.done
	-docker rmi raphaelmeyer/avr-base
	rm -rf avr-base/.done

.PHONY: clean

