
all: build run clean

build: ./src/*.c
	gcc -c ./src/*.c
	mkdir -p build && mv ./*.o ./build
	cp -r ./resources ./build
	gcc ./build/*.o -o ./build/main $(pkg-config –cflags –libs allegro-5) -lallegro -lallegro_main -lallegro_font -lallegro_image -lallegro_primitives
	chmod 755 ./build/main

clean:
	rm -rf build

run: build
	./build/main -AppleMagnifiedMode YES
	
