-- { echo }
SELECT
    avgWeighted(number, number) AS t,
    toTypeName(t)
FROM numbers(1);

SELECT
    avgWeighted(number, number + 1) AS t,
    toTypeName(t)
FROM numbers(0);

SELECT
    avgWeighted(toNullable(number), number) AS t,
    toTypeName(t)
FROM numbers(1);

SELECT
    avgWeighted(if(number < 10000, NULL, number), number) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeighted(if(number < 50, NULL, number), number) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeighted(number, if(number < 10000, NULL, number)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeighted(number, if(number < 50, NULL, number)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeighted(toNullable(number), if(number < 10000, NULL, number)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeighted(toNullable(number), if(number < 50, NULL, number)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeighted(if(number < 10000, NULL, number), toNullable(number)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeighted(if(number < 50, NULL, number), toNullable(number)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeighted(toNullable(number), if(number < 500, NULL, number)) AS t,
    toTypeName(t)
FROM numbers(1000);

SELECT
    avgWeighted(if(number < 10000, NULL, number), if(number < 10000, NULL, number)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeighted(if(number < 50, NULL, number), if(number < 10000, NULL, number)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeighted(if(number < 10000, NULL, number), if(number < 50, NULL, number)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeighted(if(number < 50, NULL, number), if(number < 50, NULL, number)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeighted(if(number < 10000, NULL, number), if(number < 500, NULL, number)) AS t,
    toTypeName(t)
FROM numbers(1000);

SELECT
    avgWeightedIf(number, number, number % 10) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(number, number, toNullable(number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(number, number, if(number < 10000, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(number, number, if(number < 50, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(number, number, if(number < 0, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(number, number, toNullable(number % 10)) AS t,
    toTypeName(t)
FROM numbers(1000);

SELECT
    avgWeightedIf(if(number < 10000, NULL, number), if(number < 10000, NULL, number), if(number < 10000, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(if(number < 50, NULL, number), if(number < 10000, NULL, number), if(number < 10000, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(if(number < 10000, NULL, number), if(number < 50, NULL, number), if(number < 10000, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(if(number < 50, NULL, number), if(number < 50, NULL, number), if(number < 10000, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(if(number < 10000, NULL, number), if(number < 10000, NULL, number), if(number < 50, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(if(number < 50, NULL, number), if(number < 10000, NULL, number), if(number < 50, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(if(number < 10000, NULL, number), if(number < 50, NULL, number), if(number < 50, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(if(number < 50, NULL, number), if(number < 50, NULL, number), if(number < 50, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(if(number < 10000, NULL, number), if(number < 10000, NULL, number), if(number < 0, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(if(number < 50, NULL, number), if(number < 10000, NULL, number), if(number < 0, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(if(number < 10000, NULL, number), if(number < 50, NULL, number), if(number < 0, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);

SELECT
    avgWeightedIf(if(number < 50, NULL, number), if(number < 50, NULL, number), if(number < 0, NULL, number % 10)) AS t,
    toTypeName(t)
FROM numbers(100);