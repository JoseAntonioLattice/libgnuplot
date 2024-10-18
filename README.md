# gnuplot library

This library has routines for plotting inside Fortran using Gnuplot


## Installation

- First clone the repository:

```
	git clone https://github.com/JoseAntonioLattice/libgnuplot-fortran.git
```

- Move to the directory where you clone the repository and run
```
	make all
```
this will compile and install the library `libgnuplot.so` on `$HOME/Fortran/lib`.

For running the test, type 
```
    make test
```

## Use

- Import the module into your program
```fortran
  program main

    use gnuplot
    implicit none

    !!!!!!!!!!! 
    ! your code
    !!!!!!!!!!!

  end program main
```
