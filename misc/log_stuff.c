#include <math.h>
#include <stdio.h>
#include <errno.h>

/* Ref. a.o. http://www.ansic.net/showlog.php?id=31&res=log%20function */

int
main(int argc, char **argv)
{
    double a, b;

    a = INFINITY;
    b = log(a);
    printf("log(%3f)\t\t= %5f errno=%2d (expected: inf / %d)\n", a, b, errno, 0);

    a = -INFINITY;
    b = log(a);
    printf("log(%3f)\t\t= %5f errno=%2d (expected: nan / %d)\n", a, b, errno, EDOM);

    a = -1;
    b = log(a);
    printf("log(%3f)\t\t= %5f errno=%2d (expected: nan / %d)\n", a, b, errno, EDOM);

    a = NAN;
    b = log(a);
    printf("log(%3f)\t\t= %5f errno=%2d (expected: nan / %d)\n", a, b, errno, EDOM);

    return 0;
}
