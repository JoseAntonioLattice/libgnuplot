libname = gnuplot
FC = gfortran
major = 0
minor = 0
release = 0
version = $(major).$(minor).$(release)

SOURCE = gnuplot.f90

OBJECTS = $(patsubst %.f90, %.o, $(SOURCE))

LIB = $(HOME)/Fortran/lib
INC = $(HOME)/Fortran/include

.PHONY : install all test readme cleanlib

all : install $(LIB)/lib$(libname).so 

$(LIB)/lib$(libname).so.$(version): $(OBJECTS)
	$(FC) -shared -o $@ $^	

%.o: %.f90
	$(FC) -O3 -fpic -c -J $(INC) $< -o $@

$(LIB)/lib$(libname).so.$(major) : $(LIB)/lib$(libname).so.$(version)
	ln -s $< $@

$(LIB)/lib$(libname).so : $(LIB)/lib$(libname).so.$(major)
	ln -s $< $@

install:
	./install.sh

test:
	@$(FC) -I$(INC) test.f90 -L$(LIB) -l$(libname)
	@LD_LIBRARY_PATH=$(LIB) ./a.out


readme:
	pandoc -f gfm README.md -o README.pdf

cleanlib:
	rm -r $(LIB)/lib$(libname).* $(INC)/lib$(libname).*
