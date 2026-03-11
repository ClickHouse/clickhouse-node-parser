SELECT '-- IN subquery';
SELECT shardNum(), number
FROM remote('127.0.0.{1..3}', numbers(100))
WHERE number IN (
    SELECT number FROM numbers(10) WHERE number = shardNum()
)
ORDER BY 1, 2;
SELECT shardNum(), number
FROM remote('127.0.0.{1..3}', numbers(100))
WHERE number GLOBAL IN (
    SELECT number FROM numbers(10) WHERE number = shardNum()
)
ORDER BY 1, 2;
SELECT shardNum(), number
FROM remote('127.0.0.{1..3}', numbers(100))
WHERE number IN (
    SELECT number FROM numbers(10) WHERE number = shardNum()
    UNION ALL
    SELECT number FROM numbers(10) WHERE number = shardNum() * 2
)
ORDER BY 1, 2;
SELECT shardNum(), number
FROM remote('127.0.0.{1..3}', numbers(100))
WHERE number GLOBAL IN (
    SELECT number FROM numbers(10) WHERE number = shardNum()
    UNION ALL
    SELECT number FROM numbers(10) WHERE number = shardNum() * 2
)
ORDER BY 1, 2;
SELECT shardNum(), tab.number
FROM remote('127.0.0.{1..3}', numbers(100)) tab
    ALL JOIN (
        SELECT number FROM numbers(10) WHERE number = shardNum()
    ) flt ON tab.number = flt.number
ORDER BY 1, 2
SETTINGS enable_analyzer = 1;
SELECT shardNum(), number
FROM remote('127.0.0.{1..3}', numbers(100))
    ALL JOIN (
        SELECT number AS flt_number FROM numbers(10) WHERE number = shardNum()
    ) flt ON number = flt_number
ORDER BY 1, 2
SETTINGS enable_analyzer = 0, joined_subquery_requires_alias = 0;
SELECT shardNum(), tab.number
FROM remote('127.0.0.{1..3}', numbers(100)) tab
    GLOBAL ALL JOIN (
        SELECT number FROM numbers(10) WHERE number = shardNum()
    ) flt ON tab.number = flt.number
ORDER BY 1, 2
SETTINGS enable_analyzer = 1;
SELECT shardNum(), number
FROM remote('127.0.0.{1..3}', numbers(100))
    GLOBAL ALL JOIN (
        SELECT number AS flt_number FROM numbers(10) WHERE number = shardNum()
    ) flt ON number = flt_number
ORDER BY 1, 2
SETTINGS enable_analyzer = 0, joined_subquery_requires_alias = 0;
SELECT shardNum(), tab.number
FROM remote('127.0.0.{1..3}', numbers(100)) tab
    ALL JOIN (
        SELECT number FROM numbers(10) WHERE number = shardNum()
        UNION ALL
        SELECT number FROM numbers(10) WHERE number = shardNum() * 2
    ) flt ON tab.number = flt.number
ORDER BY 1, 2
SETTINGS enable_analyzer = 1;
SELECT shardNum(), number
FROM remote('127.0.0.{1..3}', numbers(100))
    ALL JOIN (
        SELECT number AS flt_number FROM numbers(10) WHERE number = shardNum()
        UNION ALL
        SELECT number AS flt_number FROM numbers(10) WHERE number = shardNum() * 2
    ) flt ON number = flt_number
ORDER BY 1, 2
SETTINGS enable_analyzer = 0, joined_subquery_requires_alias = 0;
SELECT shardNum(), tab.number
FROM remote('127.0.0.{1..3}', numbers(100)) tab
    GLOBAL ALL JOIN (
        SELECT number FROM numbers(10) WHERE number = shardNum()
        UNION ALL
        SELECT number FROM numbers(10) WHERE number = shardNum() * 2
    ) flt ON tab.number = flt.number
ORDER BY 1, 2
SETTINGS enable_analyzer = 1;
SELECT shardNum(), number
FROM remote('127.0.0.{1..3}', numbers(100))
    GLOBAL ALL JOIN (
        SELECT number AS flt_number FROM numbers(10) WHERE number = shardNum()
        UNION ALL
        SELECT number AS flt_number FROM numbers(10) WHERE number = shardNum() * 2
    ) flt ON number = flt_number
ORDER BY 1, 2
SETTINGS enable_analyzer = 0, joined_subquery_requires_alias = 0;
