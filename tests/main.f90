program main
  use iso_c_binding

  implicit none

  block
    use posix

    type(c_ptr) :: cptr

    cptr = posix_malloc(10_c_size_t)
    call posix_free(cptr)
  end block
end program main
