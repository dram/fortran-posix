program main
  use iso_c_binding

  implicit none

  block
    use posix

    type(c_ptr) :: cptr
    integer(c_int) :: res
    integer(c_size_t) :: size_res
    character(132), target :: buf

    cptr = posix_malloc(10_c_size_t)
    call posix_free(cptr)

    res = posix_access("Makefile" // c_null_char, posix_f_ok)
    print *, res

    res = posix_mkdir("foo" // c_null_char, int(o'700'))
    print *, res

    res = posix_rmdir("foo" // c_null_char)
    print *, res

    cptr = posix_fopen("foo.txt" // c_null_char, "w" // c_null_char)

    res = posix_fclose(cptr)
    print *, res

    res = posix_unlink("foo.txt" // c_null_char)
    print *, res

    if (posix_mkdir("Makefile" // c_null_char, int(o'700')) == -1) then
       call posix_perror("mkdir: ")
    end if

    buf = "message" // achar(10)

    size_res = posix_write(2, c_loc(buf), 8_c_size_t)
  end block
end program main
