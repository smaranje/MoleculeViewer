CC = clang
CFLAGS = -Wall -std=c99 -pedantic
PYTHON_INCLUDE = /Library/Frameworks/Python.framework/Versions/3.11/include/python3.11
PYTHON_LIB = /Library/Frameworks/Python.framework/Versions/3.11/lib/python3.11/config-3.11-darwin

all: _molecule.so

libmol.so: mol.o
	$(CC) mol.o -shared -o libmol.so

mol.o:  mol.c mol.h
	$(CC) $(CFLAGS) -c mol.c -fPIC -o mol.o

_molecule.so: molecule_wrap.o libmol.so
	$(CC) molecule_wrap.o -shared -L. -L$(PYTHON_LIB) -lpython3.11 -ldl -framework CoreFoundation -lmol -o _molecule.so

molecule_wrap.c molecule.py: molecule.i
	swig -python molecule.i

molecule_wrap.o: molecule_wrap.c
	$(CC) $(CFLAGS) -c molecule_wrap.c -fPIC -I$(PYTHON_INCLUDE) -o molecule_wrap.o

main.o:  testPart1.c mol.h
	$(CC) $(CFLAGS) -c testPart1.c -o main.o

clean:
	rm -f molecule.py molecule_wrap.c *.o *.so myprog


