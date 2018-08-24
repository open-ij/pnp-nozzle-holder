NAME=pnp-nozzle-holder

build:
	mkdir build
	openscad -o build/$(NAME).stl mechanical/$(NAME).scad
