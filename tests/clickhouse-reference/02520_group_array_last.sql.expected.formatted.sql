SELECT groupArrayLast(number + 1)
FROM numbers(5);

SELECT groupArrayLastArray([number+1])
FROM numbers(5);

SELECT groupArrayLast(1)(number + 1)
FROM numbers(5);

SELECT groupArrayLast(3)(number + 1)
FROM numbers(5);

SELECT groupArrayLast(3)(number + 1)
FROM numbers(10);

SELECT groupArrayLast(3)(((number + 1))::String)
FROM numbers(5);

SELECT groupArrayLast(3)(((number + 1))::String)
FROM numbers(10);

SELECT groupArrayLastArray(3)([1,2,3,4,5,6]);

SELECT groupArrayLastArray(3)(['1','2','3','4','5','6']);

SELECT groupArrayLast(3)(number + 1) AS state
FROM remote('127.{1,1}', view((
        SELECT *
        FROM numbers(10)
    )));

SELECT groupArrayLast(3)(((number + 1))::String) AS state
FROM remote('127.{1,1}', view((
        SELECT *
        FROM numbers(10)
    )));

SELECT groupArrayLast(3)([number+1]) AS state
FROM remote('127.{1,1}', view((
        SELECT *
        FROM numbers(10)
    )));

SELECT groupArrayLast(100)(number + 1) AS state
FROM remote('127.{1,1}', view((
        SELECT *
        FROM numbers(10)
    )));

SELECT groupArrayLast(100)(((number + 1))::String) AS state
FROM remote('127.{1,1}', view((
        SELECT *
        FROM numbers(10)
    )));

SELECT groupArrayLast(100)([number+1]) AS state
FROM remote('127.{1,1}', view((
        SELECT *
        FROM numbers(10)
    )));

SELECT *
FROM simple_agg_groupArrayLastArray
ORDER BY
    key ASC,
    value ASC;

SELECT *
FROM simple_agg_groupArrayLastArray FINAL
ORDER BY
    key ASC,
    value ASC;