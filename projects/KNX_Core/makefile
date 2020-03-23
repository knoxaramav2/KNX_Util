HEADERS=headers
NAME=Core
SRC=KNXCore.cpp
OBJ=$(SRC:.cpp=.o)
CFLAGS = -std=gnu++17 -Wall -Iheaders -g
LIBS=
EPATH=../../bin/$(BITVRS)/$(NAME).a

%.o : %.cpp
	$(CC) $(CFLAGS) -c $< $(LIBS)

$(EPATH): $(OBJ)
	ar rcs $(EPATH) $(OBJ)