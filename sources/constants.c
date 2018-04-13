#include <unistd.h>

#include <stdio.h>

int main(void)
{
	printf("integer(c_int) :: posix_f_ok = %d\n", F_OK);
	printf("integer(c_int) :: posix_seek_end = %d\n", SEEK_END);

	return 0;
}
