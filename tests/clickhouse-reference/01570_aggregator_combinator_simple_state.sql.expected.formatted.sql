-- { echo }
WITH anySimpleState(number) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH anyLastSimpleState(number) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH minSimpleState(number) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH maxSimpleState(number) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH sumSimpleState(number) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH sumWithOverflowSimpleState(number) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH groupBitAndSimpleState(number) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH groupBitOrSimpleState(number) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH groupBitXorSimpleState(number) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH sumMapSimpleState(([number], [number])) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH minMapSimpleState(([number], [number])) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH maxMapSimpleState(([number], [number])) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH groupArrayArraySimpleState([number]) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

WITH groupUniqArrayArraySimpleState([number]) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1);

-- non-SimpleAggregateFunction
WITH countSimpleState(number) AS c

SELECT
    toTypeName(c),
    c
FROM numbers(1); -- { serverError BAD_ARGUMENTS }