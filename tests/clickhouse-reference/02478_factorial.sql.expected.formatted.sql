SELECT factorial(-1) = 1;

SELECT factorial(0) = 1;

SELECT factorial(10) = 3628800;

SELECT factorial(100); -- { serverError BAD_ARGUMENTS }

SELECT factorial('100'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT factorial(100.1234); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }