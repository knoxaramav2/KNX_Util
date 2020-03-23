FILES=dev.cpp
OBJ=$(FILES:.cpp=.o)
OUTPUT=

.cpp.o:
	$(CC) $(PLATFORM) -c -o $@ $<

dev.exe : $(OBJ)
	$(CC) -o $@ $(OBJ)