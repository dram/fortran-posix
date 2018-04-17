program main
  use iso_c_binding

  implicit none

  block
    use posix

    character(:), allocatable, target :: name, message, mode
    integer(c_int) :: res
    integer(c_long) :: long_res
    integer(c_size_t) :: size_res
    type(c_ptr) :: cptr

    cptr = posix_malloc(10_c_size_t)
    call posix_free(cptr)

    name = "foo" // c_null_char
    res = posix_mkdir(c_loc(name), int(o"700"))
    print *, "posix_mkdir", res
    res = posix_rmdir(c_loc(name))
    print *, "posix_rmdir", res

    name = "Makefile" // c_null_char
    res = posix_access(c_loc(name), posix_f_ok)
    print *, "posix_access", res

    mode = "r" // c_null_char
    cptr = posix_fopen(c_loc(name), c_loc(mode))
    res = posix_fseek(cptr, 0_c_long, posix_seek_end)
    long_res = posix_ftell(cptr)
    print *, "posix_ftell", long_res

    call posix_rewind(cptr)
    res = posix_fclose(cptr)
    print *, "posix_fclose", res

    if (posix_mkdir(c_loc(name), int(o"700")) == -1) then
       message = "mkdir: " // char(0)
       call posix_perror(c_loc(message))
    end if

    name = "foo.txt" // c_null_char
    res = posix_unlink(c_loc(name))
    print *, "posix_unlink", res

    message = "message" // achar(10)
    size_res = posix_write(2, c_loc(message), 8_c_size_t)
    print *, "posix_write", size_res

    message = "message" // achar(10) // char(0)
    size_res = posix_strlen(c_loc(message))
    print *, "posix_strlen", size_res
  end block
end program main
