module posix
  use iso_c_binding, only: c_int, c_ptr

  implicit none

  private c_int, c_ptr

  include "constants.f90"

  !! FIXME: Not quite portable.
  type(c_ptr), bind(c, name="__environ") :: posix_environ
  type(c_ptr), bind(c, name="__stderrp") :: posix_stderr
  type(c_ptr), bind(c, name="__stdinp") :: posix_stdin
  type(c_ptr), bind(c, name="__stdoutp") :: posix_stdout

  interface
     function posix_access(path, mode) &
          bind(c, name="access")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: path
       integer(c_int), value :: mode
       integer(c_int) posix_access
     end function posix_access

     function posix_close(fildes) &
          bind(c, name="close")
       use iso_c_binding, only: c_int
       integer(c_int), value :: fildes
       integer(c_int) posix_close
     end function posix_close

     function posix_fclose(stream) &
          bind(c, name="fclose")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: stream
       integer(c_int) :: posix_fclose
     end function posix_fclose

     function posix_fopen(path, mode) &
          bind(c, name="fopen")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: path, mode
       type(c_ptr) posix_fopen
     end function posix_fopen

     function posix_fputs(s, stream) &
          bind(c, name="fputs")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: s, stream
       integer(c_int) posix_fputs
     end function posix_fputs

     subroutine posix_free(cptr) &
          bind(c, name="free")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: cptr
     end subroutine posix_free

     function posix_fseek(stream, offset, whence) &
          bind(c, name="fseek")
       use iso_c_binding, only: c_int, c_long, c_ptr
       type(c_ptr), value :: stream
       integer(c_long), value :: offset
       integer(c_int), value :: whence
       integer(c_int) posix_fseek
     end function posix_fseek

     function posix_ftell(stream) &
          bind(c, name="ftell")
       use iso_c_binding, only: c_long, c_ptr
       type(c_ptr), value :: stream
       integer(c_long) posix_ftell
     end function posix_ftell

     function posix_malloc(size) &
          bind(c, name="malloc")
       use iso_c_binding, only: c_size_t, c_ptr
       integer(c_size_t), value :: size
       type(c_ptr) posix_malloc
     end function posix_malloc

     function posix_mkdir(path, mode) &
          bind(c, name="mkdir")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: path
       integer(c_int), value :: mode
       integer(c_int) posix_mkdir
     end function posix_mkdir

     function posix_mkdtemp(template) &
          bind(c, name="mkdtemp")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: template
       type(c_ptr) posix_mkdtemp
     end function posix_mkdtemp

     subroutine posix_perror(string) &
          bind(c, name="perror")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: string
     end subroutine posix_perror

     function posix_read(fildes, buf, nbyte) &
          bind(c, name="read")
       use iso_c_binding, only: c_int, c_size_t, c_ptr
       integer(c_int), value :: fildes
       type(c_ptr), value :: buf
       integer(c_size_t), value :: nbyte
       integer(c_size_t) posix_read
     end function posix_read

     subroutine posix_rewind(stream) &
          bind(c, name="rewind")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: stream
     end subroutine posix_rewind

     function posix_rmdir(path) &
          bind(c, name="rmdir")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: path
       integer(c_int) posix_rmdir
     end function posix_rmdir

     function posix_spawnp(pid, file, file_actions, attrp, argv, envp) &
          bind(c, name="posix_spawnp")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: pid, file, file_actions, attrp, argv, envp
       integer(c_int) posix_spawnp
     end function posix_spawnp

     pure function posix_strcmp(s1, s2) &
          bind(c, name="strcmp")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: s1, s2
       integer(c_int) posix_strcmp
     end function posix_strcmp

     pure function posix_strlen(s) &
          bind(c, name="strlen")
       use iso_c_binding, only: c_size_t, c_ptr
       type(c_ptr), value :: s
       integer(c_size_t) posix_strlen
     end function posix_strlen

     function posix_unlink(path) &
          bind(c, name="unlink")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: path
       integer(c_int) posix_unlink
     end function posix_unlink

     function posix_waitpid(pid, stat_loc, options) &
          bind(c, name="waitpid")
       use iso_c_binding, only: c_int, c_ptr
       integer(c_int), value :: pid, options
       type(c_ptr), value :: stat_loc
       integer(c_int) posix_waitpid
     end function posix_waitpid

     function posix_write(fd, buf, count) &
          bind(c, name="write")
       use iso_c_binding, only: c_int, c_size_t, c_ptr
       integer(c_int), value :: fd
       type(c_ptr), value :: buf
       integer(c_size_t), value :: count
       integer(c_size_t) posix_write
     end function posix_write
  end interface
end module posix
