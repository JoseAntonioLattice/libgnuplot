program test

  use iso_fortran_env, only : dp => real64, i4 => int32
  use gnuplot
  implicit none

  type(gpplot) :: plot1
  integer(i4), parameter :: n = 100
  real(dp), dimension(n) :: x, y
  integer(i4) :: i

  x = [((i-1)*0.1_dp, i =1, n)] 
  y = sin(x)
  plot1 = gpplot(y_label = "perro", title = "hola")
  !call plot(x,y,x_label = 'perro', y_label = 'puto', key ="berga", title = 'beibi')
  call plot1%plot(x,y)
end program test
