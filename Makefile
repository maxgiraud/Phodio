CC=g++
CFLAGS=
LDFLAGS=-lrt -lm -lasound -ljack -pthread -lncurses
EXEC=Phodio
SRC= $(wildcard src/*.cpp)
OBJ= $(SRC:.cpp=.o)

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ lib/libportaudio.a $(LDFLAGS)

%.o: %.cpp
	$(CC) -o $@ -c $< $(CFLAGS)

main.o: process.cpp

process.o: bitmap_image.cpp

.PHONY: release clean rebuild mrproper std

release: clean $(EXEC)
	clear
	./$(EXEC) 2> /dev/null

clean:
	rm -rfv src/*.o

rebuild: clean all

mrproper: clean
	rm -rfv $(EXEC)
