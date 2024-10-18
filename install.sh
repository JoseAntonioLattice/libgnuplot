#! /bin/bash

create_directory()
{
  if [ -d $1 ]
  then
    echo "$1 directory exists."
  else
    echo "Creating $1 directory..."
    mkdir $1
  fi
}

create_directory $HOME/Fortran

create_directory $HOME/Fortran/lib

create_directory $HOME/Fortran/include
