SELECT
    number,
    count() OVER (PARTITION BY intDiv(number, 3) ORDER BY number ASC ROWS UNBOUNDED PRECEDING)
FROM numbers(10);

SELECT
    number,
    max(number) OVER (PARTITION BY intDiv(number, 3) ORDER BY number DESC ROWS UNBOUNDED PRECEDING)
FROM numbers(10)
SETTINGS max_block_size = 2;

SELECT
    number,
    abs(number) OVER (PARTITION BY toString(intDiv(number, 3)) ROWS UNBOUNDED PRECEDING)
FROM numbers(10);

SELECT
    number,
    avg(number) OVER (ORDER BY number ASC ROWS UNBOUNDED PRECEDING)
FROM numbers(10);

SELECT
    number,
    quantileExact(number) OVER (PARTITION BY intDiv(number, 3) AS value ORDER BY number ASC ROWS UNBOUNDED PRECEDING)
FROM numbers(10);

SELECT
    number,
    quantileExact(number) OVER (PARTITION BY intDiv(number, 3) AS value ORDER BY number ASC ROWS UNBOUNDED PRECEDING) AS q
FROM numbers(10);

SELECT
    number,
    q * 10,
    quantileExact(number) OVER (PARTITION BY intDiv(number, 3) ORDER BY number ASC ROWS UNBOUNDED PRECEDING) AS q
FROM numbers(10)
ORDER BY number ASC;

SELECT *
FROM (
        SELECT count(*) OVER (ROWS UNBOUNDED PRECEDING) AS c
        FROM numbers(3)
    )
WHERE c > 0;

SELECT
    number,
    max(number) OVER (PARTITION BY intDiv(number, 3) ORDER BY number DESC ROWS UNBOUNDED PRECEDING) AS m
FROM numbers(10)
ORDER BY
    m DESC,
    number ASC;

SELECT *
FROM (
        SELECT count(*) OVER (ROWS UNBOUNDED PRECEDING) AS c
        FROM numbers(3)
    )
ORDER BY c ASC;

SELECT *
FROM (
        SELECT *
        FROM numbers(5)
        ORDER BY rand() ASC
    )
ORDER BY count() OVER (ORDER BY number DESC ROWS UNBOUNDED PRECEDING) DESC;

SELECT *
FROM (
        SELECT *
        FROM numbers(5)
        ORDER BY rand() ASC
    )
GROUP BY number
ORDER BY sum(any(number + 1)) OVER (ORDER BY min(number) DESC ROWS UNBOUNDED PRECEDING) DESC;

SELECT sum(any(number)) OVER (ROWS UNBOUNDED PRECEDING)
FROM numbers(1);

SELECT sum(any(number) + 1) OVER (ROWS UNBOUNDED PRECEDING)
FROM numbers(1);

SELECT sum(any(number + 1)) OVER (ROWS UNBOUNDED PRECEDING)
FROM numbers(1);

SELECT
    number,
    max(number) OVER (PARTITION BY intDiv(number, 3) ORDER BY number DESC ROWS UNBOUNDED PRECEDING),
    count(number) OVER (PARTITION BY intDiv(number, 5) ORDER BY number ASC ROWS UNBOUNDED PRECEDING) AS m
FROM numbers(31)
ORDER BY number ASC
SETTINGS max_block_size = 2;

SELECT
    number,
    max(number) OVER (PARTITION BY intDiv(number, 3) ORDER BY number DESC ROWS UNBOUNDED PRECEDING),
    count(number) OVER (PARTITION BY intDiv(number, 3) ORDER BY number DESC ROWS UNBOUNDED PRECEDING) AS m
FROM numbers(7)
ORDER BY number ASC
SETTINGS max_block_size = 2;

SELECT median(x) OVER (PARTITION BY x)
FROM (
        SELECT 1 AS x
    );

SELECT groupArray(number) OVER (ROWS UNBOUNDED PRECEDING)
FROM numbers(3);

SELECT groupArray(number) OVER ()
FROM numbers(3);

SELECT
    count(1) OVER (ROWS UNBOUNDED PRECEDING),
    max(number + 1) OVER ()
FROM numbers(3);

SELECT DISTINCT sum(0) OVER (ROWS UNBOUNDED PRECEDING)
FROM numbers(2);

SELECT DISTINCT any(number) OVER (ROWS UNBOUNDED PRECEDING)
FROM numbers(2);

SELECT 1
WINDOW w1 AS ();

SELECT
    sum(number),
    sum(number)
FROM numbers(10)
WINDOW
    w1 AS (rows unbounded preceding),
    w2 AS (partition by intDiv(number, 3) as value order by number rows unbounded preceding);

SELECT
    sum(number),
    sum(number) OVER (PARTITION BY intDiv(number, 3) AS value ORDER BY number ASC ROWS UNBOUNDED PRECEDING)
FROM numbers(10)
WINDOW w1 AS (partition by intDiv(number, 3) rows unbounded preceding);

SELECT sum(number) OVER ()
FROM numbers(3);

SELECT
    number,
    intDiv(number, 3) AS p,
    mod(number, 2) AS o,
    count(number) AS c
FROM numbers(31)
ORDER BY number ASC
WINDOW w AS (partition by p order by o, number range unbounded preceding)
SETTINGS max_block_size = 5;

SELECT
    number,
    intDiv(number, 5) AS p,
    mod(number, 3) AS o,
    count(number) AS c
FROM numbers(31)
ORDER BY number ASC
WINDOW w AS (partition by p order by o, number range unbounded preceding)
SETTINGS max_block_size = 2;

SELECT
    number,
    intDiv(number, 5) AS p,
    mod(number, 2) AS o,
    count(number) AS c
FROM numbers(31)
ORDER BY number ASC
WINDOW w AS (partition by p order by o, number range unbounded preceding)
SETTINGS max_block_size = 3;

SELECT
    number,
    intDiv(number, 3) AS p,
    mod(number, 5) AS o,
    count(number) AS c
FROM numbers(31)
ORDER BY number ASC
WINDOW w AS (partition by p order by o, number range unbounded preceding)
SETTINGS max_block_size = 2;

SELECT
    number,
    intDiv(number, 2) AS p,
    mod(number, 5) AS o,
    count(number) AS c
FROM numbers(31)
ORDER BY number ASC
WINDOW w AS (partition by p order by o, number range unbounded preceding)
SETTINGS max_block_size = 3;

SELECT
    number,
    intDiv(number, 2) AS p,
    mod(number, 3) AS o,
    count(number) AS c
FROM numbers(31)
ORDER BY number ASC
WINDOW w AS (partition by p order by o range unbounded preceding)
SETTINGS max_block_size = 5;

SELECT min(number) OVER (PARTITION BY p)
FROM (
        SELECT
            number,
            intDiv(number, 3) AS p
        FROM numbers(10)
    );

SELECT
    min(number),
    min(number),
    max(number),
    max(number)
FROM (
        SELECT
            number,
            intDiv(number, 3) AS p,
            mod(number, 5) AS o
        FROM numbers(31)
    )
WINDOW
    wa AS (partition by p order by o
        range between unbounded preceding and unbounded following),
    wo AS (partition by p order by o
        rows between unbounded preceding and unbounded following)
SETTINGS max_block_size = 2;

SELECT
    number,
    p,
    count(*) OVER (PARTITION BY p ORDER BY number ASC ROWS BETWEEN 1 PRECEDING AND UNBOUNDED PRECEDING),
    count(*) OVER (PARTITION BY p ORDER BY number ASC ROWS BETWEEN CURRENT ROW AND UNBOUNDED PRECEDING),
    count(*) OVER (PARTITION BY p ORDER BY number ASC ROWS BETWEEN 1 FOLLOWING AND UNBOUNDED PRECEDING)
FROM (
        SELECT
            number,
            intDiv(number, 5) AS p
        FROM numbers(31)
    )
ORDER BY
    p ASC,
    number ASC
SETTINGS max_block_size = 2;

SELECT
    number,
    p,
    count(*) OVER (PARTITION BY p ORDER BY number ASC ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING)
FROM (
        SELECT
            number,
            intDiv(number, 7) AS p
        FROM numbers(71)
    )
ORDER BY
    p ASC,
    number ASC
SETTINGS max_block_size = 2;

SELECT count(*) OVER (ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
FROM numbers(4);

SELECT
    count() OVER (PARTITION BY intDiv(number, 3) ROWS BETWEEN 100 FOLLOWING AND UNBOUNDED PRECEDING),
    count() OVER (PARTITION BY intDiv(number, 3) ROWS BETWEEN CURRENT ROW AND 100 FOLLOWING)
FROM numbers(10);

SELECT
    number,
    max(number) OVER (PARTITION BY intDiv(number, 7) ORDER BY number ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM numbers(1024)
SETTINGS max_block_size = 2
FORMAT Null;

SELECT count() OVER ();

SELECT
    number,
    p,
    o,
    count(*) OVER (PARTITION BY p ORDER BY o ASC RANGE BETWEEN CURRENT ROW AND UNBOUNDED PRECEDING)
FROM (
        SELECT
            number,
            intDiv(number, 5) AS p,
            mod(number, 3) AS o
        FROM numbers(31)
    )
ORDER BY
    p ASC,
    o ASC,
    number ASC
SETTINGS max_block_size = 2;

SELECT
    count(*) OVER (ROWS BETWEEN CURRENT ROW AND CURRENT ROW),
    count(*) OVER (RANGE BETWEEN CURRENT ROW AND CURRENT ROW)
FROM numbers(3);

SELECT
    x,
    min(x),
    max(x),
    count(x)
FROM (
        SELECT toUInt8(number) AS x
        FROM numbers(11)
    )
ORDER BY x ASC
WINDOW w AS (order by x asc range between 1 preceding and 2 following);

SELECT
    x,
    min(x),
    max(x),
    count(x)
FROM (
        SELECT toUInt8(if(mod(number, 2), toInt64(255 - intDiv(number, 2)), toInt64(intDiv(number, 2)))) AS x
        FROM numbers(10)
    )
ORDER BY x ASC
WINDOW w AS (order by x range between 1 preceding and 2 following);

SELECT
    x,
    min(x),
    max(x),
    count(x)
FROM (
        SELECT toInt8(multiIf(mod(number, 3) == 0, toInt64(intDiv(number, 3)), mod(number, 3) == 1, toInt64(127 - intDiv(number, 3)), toInt64(-128 + intDiv(number, 3)))) AS x
        FROM numbers(15)
    )
ORDER BY x ASC
WINDOW w AS (order by x range between 1 preceding and 2 following);

SELECT
    x,
    min(x),
    max(x),
    count(x)
FROM (
        SELECT toUInt8(if(mod(number, 2), toInt64(255 - intDiv(number, 2)), toInt64(intDiv(number, 2)))) AS x
        FROM numbers(10)
    )
ORDER BY x ASC
WINDOW w AS (order by x range between 255 preceding and 255 following);

SELECT
    x,
    min(x),
    max(x),
    count(x)
FROM (
        SELECT toUInt8(number) AS x
        FROM numbers(11)
    ) AS t
ORDER BY x ASC
WINDOW w AS (order by x desc range between 1 preceding and 2 following)
SETTINGS max_block_size = 1;

SELECT
    x,
    min(x),
    max(x),
    count(x)
FROM (
        SELECT toUInt8(number) AS x
        FROM numbers(11)
    ) AS t
ORDER BY x ASC
WINDOW w AS (order by x desc range between 1 preceding and unbounded following)
SETTINGS max_block_size = 2;

SELECT
    x,
    min(x),
    max(x),
    count(x)
FROM (
        SELECT toUInt8(number) AS x
        FROM numbers(11)
    ) AS t
ORDER BY x ASC
WINDOW w AS (order by x desc range between unbounded preceding and 2 following)
SETTINGS max_block_size = 3;

SELECT
    x,
    min(x),
    max(x),
    count(x)
FROM (
        SELECT toUInt8(number) AS x
        FROM numbers(11)
    ) AS t
ORDER BY x ASC
WINDOW w AS (order by x desc range between unbounded preceding and 2 preceding)
SETTINGS max_block_size = 4;

SELECT
    number,
    count(*) OVER (PARTITION BY p ORDER BY number ASC),
    count(*) OVER (PARTITION BY p ORDER BY number ASC, o ASC),
    count(*) OVER (),
    count(*) OVER (ORDER BY number ASC),
    count(*) OVER (ORDER BY o ASC),
    count(*) OVER (ORDER BY o ASC, number ASC),
    count(*) OVER (ORDER BY number ASC, o ASC),
    count(*) OVER (PARTITION BY p ORDER BY o ASC, number ASC),
    count(*) OVER (PARTITION BY p),
    count(*) OVER (PARTITION BY p ORDER BY o ASC),
    count(*) OVER (PARTITION BY p, o ORDER BY number ASC)
FROM (
        SELECT
            number,
            intDiv(number, 3) AS p,
            mod(number, 5) AS o
        FROM numbers(16)
    ) AS t
ORDER BY number ASC;

SELECT
    max(number) OVER (ORDER BY number DESC),
    max(number) OVER (ORDER BY number ASC)
FROM numbers(2);

SELECT
    number,
    count(*) OVER (PARTITION BY p)
FROM window_mt
ORDER BY number ASC
LIMIT 10
SETTINGS optimize_read_in_order = 0;

SELECT
    number,
    count(*) OVER (PARTITION BY p)
FROM window_mt
ORDER BY number ASC
LIMIT 10
SETTINGS optimize_read_in_order = 1;

SELECT
    number,
    p,
    o,
    count(*),
    rank(),
    dense_rank(),
    row_number()
FROM (
        SELECT
            number,
            intDiv(number, 5) AS p,
            mod(number, 3) AS o
        FROM numbers(31)
        ORDER BY
            o ASC,
            number ASC
    ) AS t
ORDER BY
    p ASC,
    o ASC,
    number ASC
WINDOW w AS (partition by p order by o, number)
SETTINGS max_block_size = 2;

SELECT
    anyOrNull(number) OVER (ORDER BY number ASC ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING),
    anyOrNull(number) OVER (ORDER BY number ASC ROWS BETWEEN 1 FOLLOWING AND 1 FOLLOWING)
FROM numbers(5);

SELECT
    number,
    p,
    pp,
    lagInFrame(number) AS lag1,
    lagInFrame(number, number - pp) AS lag2,
    lagInFrame(number, number - pp, number * 11) AS lag,
    leadInFrame(number, number - pp, number * 11) AS lead
FROM (
        SELECT
            number,
            intDiv(number, 5) AS p,
            p * 5 AS pp
        FROM numbers(16)
    )
ORDER BY number ASC
WINDOW w AS (partition by p order by number
    rows between unbounded preceding and unbounded following)
SETTINGS max_block_size = 3;

SELECT lagInFrame(toNullable(1)) OVER ();

SELECT lagInFrameOrNull(1) OVER ();

SELECT
    intDiv(1, NULL) AS x,
    toTypeName(x),
    max(x) OVER ();

SELECT
    number,
    lagInFrame(toNullable(number), 1),
    lagInFrame(toNullable(number), 2),
    lagInFrame(number, 1),
    lagInFrame(number, 2)
FROM numbers(4)
WINDOW w AS (ORDER BY number ASC);

SELECT
    number,
    fIrSt_VaLue(number),
    lAsT_vAlUe(number)
FROM numbers(10)
ORDER BY number ASC
WINDOW w AS (order by number range between 1 preceding and 1 following);

SELECT
    number,
    nth_value(number, 1) AS firstValue,
    nth_value(number, 2) AS secondValue,
    nth_value(number, 3) AS thirdValue,
    nth_value(number, 4) AS fourthValue
FROM numbers(10)
ORDER BY number ASC
WINDOW w AS (order by number);

SELECT
    number,
    nth_value(number, 1) AS firstValue,
    nth_value(number, 2) AS secondValue,
    nth_value(number, 3) AS thirdValue,
    nth_value(number, 4) AS fourthValue
FROM numbers(10)
ORDER BY number ASC
WINDOW w AS (order by number range between 1 preceding and 1 following);

SELECT
    number,
    nth_value(toNullable(number), 1) AS firstValue,
    nth_value(toNullable(number), 3) AS thridValue
FROM numbers(5)
WINDOW w AS (ORDER BY number ASC);

SELECT nth_value(1, -1) OVER ();

SELECT nth_value(1, 0) OVER ();

SELECT nth_value(1, 0x7fffffffffffffff + 1) OVER ();

SELECT nth_value(1, 0x7fffffffffffffff) OVER ();

SELECT nth_value(1, 1) OVER ();

SELECT lagInFrame(1, -1) OVER ();

SELECT lagInFrame(1, 0) OVER ();

SELECT lagInFrame(1, 0x7fffffffffffffff + 1) OVER ();

SELECT lagInFrame(1, 0x7fffffffffffffff) OVER ();

SELECT lagInFrame(1, 1) OVER ();

SELECT leadInFrame(1, -1) OVER ();

SELECT leadInFrame(1, 0) OVER ();

SELECT leadInFrame(1, 0x7fffffffffffffff + 1) OVER ();

SELECT leadInFrame(1, 0x7fffffffffffffff) OVER ();

SELECT leadInFrame(1, 1) OVER ();

SELECT nth_value(1, '') OVER ();

SELECT lagInFrame(1, '') OVER ();

SELECT leadInFrame(1, '') OVER ();

SELECT count() OVER ()
FROM numbers(4)
WHERE number < 2;

SELECT
    count(*) OVER (ORDER BY toFloat32(number) ASC RANGE 5 PRECEDING),
    count(*) OVER (ORDER BY toFloat64(number) ASC RANGE 5 PRECEDING),
    count(*) OVER (ORDER BY toFloat32(number) ASC RANGE BETWEEN CURRENT ROW AND 5 FOLLOWING),
    count(*) OVER (ORDER BY toFloat64(number) ASC RANGE BETWEEN CURRENT ROW AND 5 FOLLOWING)
FROM numbers(7);

SELECT count() OVER (ORDER BY toInt64(number) ASC RANGE BETWEEN -1 PRECEDING AND UNBOUNDED PRECEDING)
FROM numbers(1);

SELECT count() OVER (ORDER BY toInt64(number) ASC RANGE BETWEEN -1 FOLLOWING AND UNBOUNDED PRECEDING)
FROM numbers(1);

SELECT count() OVER (ORDER BY toInt64(number) ASC RANGE BETWEEN UNBOUNDED PRECEDING AND -1 PRECEDING)
FROM numbers(1);

SELECT count() OVER (ORDER BY toInt64(number) ASC RANGE BETWEEN UNBOUNDED PRECEDING AND -1 FOLLOWING)
FROM numbers(1);

SELECT sum(a[length(a)])
FROM (
        SELECT groupArray(number) OVER (PARTITION BY modulo(number, 11) ORDER BY modulo(number, 1111) ASC, number ASC) AS a
        FROM numbers_mt(10000)
    )
SETTINGS max_block_size = 7;

SELECT bitmapCardinality(bs)
FROM (
        SELECT groupBitmapMergeState(bm) OVER (ORDER BY k ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS bs
        FROM (
                SELECT
                    groupBitmapState(number) AS bm,
                    k
                FROM (
                        SELECT
                            number,
                            number % 3 AS k
                        FROM numbers(3)
                    )
                GROUP BY k
            )
    );

SELECT count() OVER (ROWS BETWEEN 2147483648 PRECEDING AND 2147493648 FOLLOWING)
FROM numbers(2);

SELECT count() OVER ()
FROM
    (
        SELECT 1 AS a
    ) AS l
INNER JOIN (
        SELECT 2 AS a
    ) AS r
    USING (a);

SELECT count() OVER ()
WHERE NULL;

SELECT
    number,
    count() OVER (ROWS UNBOUNDED PRECEDING)
FROM numbers(10)
ORDER BY
    p ASC,
    o ASC,
    number ASC
WINDOW
    w0 AS (partition by intDiv(number, 5) as p),
    w1 AS (w0 order by mod(number, 3) as o, number);

SELECT count() OVER (PARTITION BY number)
FROM numbers(1)
WINDOW w AS (partition by intDiv(number, 5));

SELECT count() OVER (ORDER BY number ASC)
FROM numbers(1)
WINDOW w AS (partition by intDiv(number, 5) order by mod(number, 3));

SELECT count() OVER (RANGE UNBOUNDED PRECEDING)
FROM numbers(1)
WINDOW w AS (partition by intDiv(number, 5) order by mod(number, 3) rows unbounded preceding);

SELECT count() OVER ()
FROM numbers(1)
WINDOW w AS ();

SELECT count() OVER (ROWS UNBOUNDED PRECEDING);