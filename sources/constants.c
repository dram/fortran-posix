#include <stdio.h>
#include <unistd.h>

#define INT_PARAMETER "integer(c_int), parameter :: "

int main(void)
{
	printf(INT_PARAMETER "posix_f_ok = %d\n", F_OK);
	printf(INT_PARAMETER "posix_seek_end = %d\n", SEEK_END);

	return 0;
}
