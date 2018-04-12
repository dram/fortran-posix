module posix
  use iso_c_binding

  implicit none

  !! FIXME: Not quite portable.
  type(c_ptr), bind(c, name="__stderrp") :: posix_stderr
  type(c_ptr), bind(c, name="__stdinp") :: posix_stdin
  type(c_ptr), bind(c, name="__stdoutp") :: posix_stdout

  interface
     function posix_fclose(stream) result(res) &
          bind(c, name="fclose")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: stream
       integer(c_int) :: res
     end function posix_fclose

     function posix_fopen(path, mode) result(res) &
          bind(c, name="fopen")
       use iso_c_binding, only: c_char, c_ptr
       character(kind=c_char), intent(in) :: path (*), mode (*)
       type(c_ptr) :: res
     end function posix_fopen

     subroutine posix_free(cptr) &
          bind(c, name="free")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: cptr
     end subroutine posix_free

     function posix_malloc(size) result(cptr) &
          bind(c, name="malloc")
       use iso_c_binding, only: c_size_t, c_ptr
       integer(c_size_t), value :: size
       type(c_ptr) :: cptr
     end function posix_malloc
  end interface
end module posix
