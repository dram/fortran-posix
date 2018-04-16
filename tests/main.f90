program main
  use iso_c_binding

  implicit none

  block
    use posix

    type(c_ptr) :: cptr
    integer(c_int) :: res
    integer(c_long) :: long_res
    integer(c_size_t) :: size_res
    character(132), target :: buf

    cptr = posix_malloc(10_c_size_t)
    call posix_free(cptr)

    res = posix_access("Makefile" // c_null_char, posix_f_ok)
    print *, "posix_access", res

    res = posix_mkdir("foo" // c_null_char, int(o'700'))
    print *, "posix_mkdir", res

    res = posix_rmdir("foo" // c_null_char)
    print *, "posix_rmdir", res

    cptr = posix_fopen("Makefile" // c_null_char, "r" // c_null_char)

    res = posix_fseek(cptr, 0_c_long, posix_seek_end)
    long_res = posix_ftell(cptr)
    print *, "posix_ftell", long_res
    call posix_rewind(cptr)

    res = posix_fclose(cptr)
    print *, "posix_fclose", res

    res = posix_unlink("foo.txt" // c_null_char)
    print *, "posix_unlink", res

    if (posix_mkdir("Makefile" // c_null_char, int(o'700')) == -1) then
       call posix_perror("mkdir: " // char(0))
    end if

    buf = "message" // achar(10)
    size_res = posix_write(2, c_loc(buf), 8_c_size_t)
    print *, "posix_write", size_res

    buf = "message" // achar(10) // char(0)
    size_res = posix_strlen(c_loc(buf))
    print *, "posix_strlen", size_res
  end block
end program main
