SELECT quantilesGK(10000, 0.25, 0.5, 0.75, 0.0, 1.0, 0, 1)(number + 1)
FROM numbers(1000);

SELECT quantilesGK(10000, 0.01, 0.1, 0.11)(number + 1)
FROM numbers(10);

SELECT quantilesGK(1, 100 / 1000, 200 / 1000, 250 / 1000, 314 / 1000, 777 / 1000)(number + 1)
FROM numbers(1000);

SELECT quantilesGK(10, 100 / 1000, 200 / 1000, 250 / 1000, 314 / 1000, 777 / 1000)(number + 1)
FROM numbers(1000);

SELECT quantilesGK(100, 100 / 1000, 200 / 1000, 250 / 1000, 314 / 1000, 777 / 1000)(number + 1)
FROM numbers(1000);

SELECT quantilesGK(1000, 100 / 1000, 200 / 1000, 250 / 1000, 314 / 1000, 777 / 1000)(number + 1)
FROM numbers(1000);

SELECT quantilesGK(10000, 100 / 1000, 200 / 1000, 250 / 1000, 314 / 1000, 777 / 1000)(number + 1)
FROM numbers(1000);

SELECT quantileGKMerge(100, 0.5)(x)
FROM (
        SELECT quantileGKState(100, 0.5)(number + 1) AS x
        FROM numbers(49999)
    );

SELECT quantilesGKMerge(100, 0.5, 0.9, 0.99)(x)
FROM (
        SELECT quantilesGKState(100, 0.5, 0.9, 0.99)(number + 1) AS x
        FROM numbers(49999)
    );

SELECT medianGK()(number)
FROM numbers(10)
SETTINGS enable_analyzer = 0; -- { serverError BAD_ARGUMENTS }

SELECT medianGK()(number)
FROM numbers(10)
SETTINGS enable_analyzer = 1; -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT quantileGK()(number)
FROM numbers(10)
SETTINGS enable_analyzer = 0; -- { serverError BAD_ARGUMENTS }

SELECT quantileGK()(number)
FROM numbers(10)
SETTINGS enable_analyzer = 1; -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT medianGK(100)(number)
FROM numbers(10);

SELECT quantileGK(100)(number)
FROM numbers(10);

SELECT quantileGK(100, 0.5)(number)
FROM numbers(10);

SELECT quantileGK(100, 0.5, 0.75)(number)
FROM numbers(10); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT quantileGK('abc', 0.5)(number)
FROM numbers(10); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT quantileGK(1.23, 0.5)(number)
FROM numbers(10); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT quantileGK(-100, 0.5)(number)
FROM numbers(10); -- { serverError BAD_ARGUMENTS }

SELECT quantilesGK()(number)
FROM numbers(10)
SETTINGS enable_analyzer = 0; -- { serverError BAD_ARGUMENTS }

SELECT quantilesGK()(number)
FROM numbers(10)
SETTINGS enable_analyzer = 1; -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT quantilesGK(100)(number)
FROM numbers(10); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT quantilesGK(100, 0.5)(number)
FROM numbers(10);

SELECT quantilesGK('abc', 0.5, 0.75)(number)
FROM numbers(10); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT quantilesGK(1.23, 0.5, 0.75)(number)
FROM numbers(10); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT quantilesGK(-100, 0.5, 0.75)(number)
FROM numbers(10); -- { serverError BAD_ARGUMENTS }