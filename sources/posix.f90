module posix
  use iso_c_binding

  implicit none

  !! FIXME: Not quite portable.
  type(c_ptr), bind(c, name="__stderrp") :: posix_stderr
  type(c_ptr), bind(c, name="__stdinp") :: posix_stdin
  type(c_ptr), bind(c, name="__stdoutp") :: posix_stdout

  interface
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
