module gnuplot

  use iso_fortran_env, only : dp => real64, i4 => int32
  implicit none

  type gpplot
     character(:), allocatable :: x_label 
     character(:), allocatable :: y_label != ' '
     character(:), allocatable :: key     != ' '
     character(:), allocatable :: title   != ' '
   contains
     procedure :: plot 
  end type gpplot 
contains

  subroutine plot(self,x,y)
    class(gpplot) :: self
    real(dp), dimension(:), intent(in) :: x, y
    integer(i4) :: outunit, i
    character(256) :: arguments

    if (.not. allocated(self%x_label)) self%x_label = ''
    if (.not. allocated(self%y_label)) self%y_label = ''
    if (.not. allocated(self%key))     self%key = ''
    if (.not. allocated(self%title))   self%title = ''

    self%x_label = "'"//self%x_label//"'"
    self%y_label = "'"//self%y_label//"'"
    self%key     = "'"//self%key//"'"
    self%title   = "'"//self%title//"'"
    
    arguments = self%x_label//" "//self%y_label//" "//self%key//" "//self%title
    print*, trim(arguments)
    
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
