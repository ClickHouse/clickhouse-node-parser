CREATE FUNCTION 02125_function AS x -> 02125_function(x);
SELECT 02125_function(1); --{serverError UNSUPPORTED_METHOD};
CREATE FUNCTION 02125_function_1 AS x -> 02125_function_2(x);
CREATE FUNCTION 02125_function_2 AS x -> 02125_function_1(x);
SELECT 02125_function_1(1); --{serverError UNSUPPORTED_METHOD};
SELECT 02125_function_2(2); --{serverError UNSUPPORTED_METHOD};
CREATE OR REPLACE FUNCTION 02125_function_2 AS x -> x + 1;
