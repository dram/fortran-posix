#include <unistd.h>

#include <stdio.h>

int main(void)
{
	printf("integer(c_int) :: posix_f_ok = %d\n",
	       F_OK);

	return 0;
}
