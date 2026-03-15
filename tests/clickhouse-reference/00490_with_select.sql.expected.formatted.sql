SET enable_analyzer = 1;

SELECT
    `pow(four, 2)`,
    `pow(two, 2)`
FROM (
        WITH pow(2, 2) AS four

        SELECT
            pow(four, 2),
            2 AS two,
            pow(two, 2)
    );

SELECT
    `pow(four, 2)`,
    `pow(two, 2)`
FROM (
        WITH (
                SELECT pow(2, 2)
            ) AS four

        SELECT
            pow(four, 2),
            2 AS two,
            pow(two, 2)
    );

SELECT `concat(str, '_abc')`
FROM (
        WITH 'string' AS str

        SELECT concat(str, '_abc')
    );