SELECT arrayWithConstant(96142475, ['qMUF']);

SELECT arrayWithConstant(100000000, materialize([[[[[[[[[['Hello, world!']]]]]]]]]]));

SELECT length(arrayWithConstant(10000000, materialize([[[[[[[[[['Hello world']]]]]]]]]])));

SELECT length(arrayWithConstant(1000000, value))
FROM args
FORMAT NULL;