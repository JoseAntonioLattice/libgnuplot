module gnuplot

  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

contains

  subroutine plot(x,y,x_label,y_label,key,title)
    real(dp), dimension(:), intent(in) :: x, y
    character(*), intent(in), optional :: x_label, y_label, title, key
    character(:), allocatable :: x_str, y_str, title_str, key_str
    integer(i4) :: outunit, i
    character(256) :: arguments

    call check_prescence(x_label,x_str)
    call check_prescence(y_label,y_str)
    call check_prescence(title,title_str)
    call check_prescence(key,key_str)
    arguments = x_str//" "//y_str//" "//key_str//" "//title_str
    
    open(newunit = outunit, file = '/tmp/temp.dat')
    do i = 1, size(x)
       write(outunit,*) x(i), y(i)
    end do
    call execute_command_line("gnuplot -p -c "//"'plot1.plt' "//trim(arguments))
    close(outunit)
    call execute_command_line("rm /tmp/temp.dat")
  end subroutine plot

  subroutine check_prescence(arg,str)
    character(*), intent(in), optional :: arg
    character(:), allocatable :: str

    if(present(arg))then
       str = trim(arg)
    else
       str = ''
    end if
  end subroutine check_prescence
  
end module gnuplot
