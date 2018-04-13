module posix
  use iso_c_binding

  implicit none

  include "constants.f90"

  !! FIXME: Not quite portable.
  type(c_ptr), bind(c, name="__stderrp") :: posix_stderr
  type(c_ptr), bind(c, name="__stdinp") :: posix_stdin
  type(c_ptr), bind(c, name="__stdoutp") :: posix_stdout

  interface
     function posix_access(path, mode) result(res) &
          bind(c, name="access")
       use iso_c_binding, only: c_char, c_int, c_ptr
       character(kind=c_char), intent(in) :: path (*)
       integer(c_int), value :: mode
       integer(c_int) :: res
     end function posix_access

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

     function posix_fputs(s, stream) result(res) &
          bind(c, name="fputs")
       use iso_c_binding, only: c_char, c_int, c_ptr
       character(kind=c_char), intent(in) :: s (*)
       type(c_ptr), value :: stream
       integer(c_int) :: res
     end function posix_fputs

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

     function posix_mkdir(path, mode) result(res) &
          bind(c, name="mkdir")
       use iso_c_binding, only: c_char, c_int, c_ptr
       character(kind=c_char), intent(in) :: path (*)
       integer(c_int), value :: mode
       integer(c_int) :: res
     end function posix_mkdir

     subroutine posix_perror(string) &
          bind(c, name="perror")
       use iso_c_binding, only: c_char
       character(kind=c_char), intent(in) :: string (*)
     end subroutine posix_perror

     function posix_rmdir(path) result(res) &
          bind(c, name="rmdir")
       use iso_c_binding, only: c_char, c_int
       character(kind=c_char), intent(in) :: path (*)
       integer(c_int) :: res
     end function posix_rmdir

     function posix_unlink(path) result(res) &
          bind(c, name="unlink")
       use iso_c_binding, only: c_char, c_int
       character(kind=c_char), intent(in) :: path (*)
       integer(c_int) :: res
     end function posix_unlink

     function posix_write(fd, buf, count) result(res) &
          bind(c, name="write")
       use iso_c_binding, only: c_int, c_size_t, c_ptr
       integer(c_int), value :: fd
       type(c_ptr), value :: buf
       integer(c_size_t), value :: count
       integer(c_size_t) :: res
     end function posix_write

  end interface
end module posix
