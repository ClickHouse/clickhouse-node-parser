SELECT
    number,
    neighbor(number, 2)
FROM `system`.numbers
LIMIT 10;

SELECT runningDifference(number)
FROM `system`.numbers
LIMIT 10;

SELECT
    k,
    runningAccumulate(sum_k) AS res
FROM (
        SELECT
            number AS k,
            sumState(k) AS sum_k
        FROM numbers(10)
        GROUP BY k
        ORDER BY k ASC
    );

SELECT
    number,
    neighbor(number, 2)
FROM `system`.numbers
LIMIT 10
FORMAT Null;

SELECT runningDifference(number)
FROM `system`.numbers
LIMIT 10
FORMAT Null;

SELECT
    k,
    runningAccumulate(sum_k) AS res
FROM (
        SELECT
            number AS k,
            sumState(k) AS sum_k
        FROM numbers(10)
        GROUP BY k
        ORDER BY k ASC
    )
FORMAT Null;