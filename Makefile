libname = gnuplot
FC = gfortran
major = 0
minor = 0
release = 0
version = $(major).$(minor).$(release)

LIB = $(HOME)/Fortran/lib
INC = $(HOME)/Fortran/include

.PHONY : install compile all test

all : install compile 

compile : 
	$(FC) -O3 -fpic -c -J $(INC) $(libname).f90
	$(FC) -shared -o $(LIB)/lib$(libname).so.$(version) $(libname).o
	rm *.o
	ln -s $(LIB)/lib$(libname).so.$(version) $(LIB)/lib$(libname).so.$(major)
	ln -s $(LIB)/lib$(libname).so.$(major) $(LIB)/lib$(libname).so

install:
	./install.sh

test:
	@$(FC) -I$(INC) test.f90 -L$(LIB) -l$(libname)
	@LD_LIBRARY_PATH=$(LIB) ./a.out


readme:
	pandoc -f gfm README.md -o README.pdf
