# gnuplot library

This library has routines to solve for plotting inside Fortran using Gnuplot


## Installation

- First clone the repository:

```
	git clone
```

- Move to the directory where you clone the repository and run
```
	make all
```
this will compile and install the library `libgnuplot.so` on `$HOME/Fortran/lib`


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