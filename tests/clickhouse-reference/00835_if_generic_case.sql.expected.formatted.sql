SELECT
    toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul') AS x,
    toDate('2000-01-02') AS y,
    if(x > y, x, y) AS z;

SELECT
    materialize(toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul')) AS x,
    toDate('2000-01-02') AS y,
    if(x > y, x, y) AS z;

SELECT
    toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul') AS x,
    materialize(toDate('2000-01-02')) AS y,
    if(x > y, x, y) AS z;

SELECT
    materialize(toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul')) AS x,
    materialize(toDate('2000-01-02')) AS y,
    if(x > y, x, y) AS z;

SELECT
    toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul') AS x,
    toDate('2000-01-02') AS y,
    if(0, x, y) AS z;

SELECT
    materialize(toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul')) AS x,
    toDate('2000-01-02') AS y,
    if(0, x, y) AS z;

SELECT
    toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul') AS x,
    materialize(toDate('2000-01-02')) AS y,
    if(0, x, y) AS z;

SELECT
    materialize(toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul')) AS x,
    materialize(toDate('2000-01-02')) AS y,
    if(0, x, y) AS z;

SELECT
    toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul') AS x,
    toDate('2000-01-02') AS y,
    if(1, x, y) AS z;

SELECT
    materialize(toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul')) AS x,
    toDate('2000-01-02') AS y,
    if(1, x, y) AS z;

SELECT
    toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul') AS x,
    materialize(toDate('2000-01-02')) AS y,
    if(1, x, y) AS z;

SELECT
    materialize(toDateTime('2000-01-01 00:00:00', 'Asia/Istanbul')) AS x,
    materialize(toDate('2000-01-02')) AS y,
    if(1, x, y) AS z;

SELECT if(rand() % 2 = 0, number, number)
FROM numbers(5);

SELECT if(rand() % 2 = 0, number, toString(number))
FROM numbers(5); -- { serverError NO_COMMON_TYPE }