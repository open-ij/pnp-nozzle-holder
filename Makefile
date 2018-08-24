NAME=pnp-nozzle-holder

.PHONY: build
build:
	mkdir -p build
	openscad -o build/$(NAME).stl mechanical/$(NAME).scad

clean:
	rm -rf build
