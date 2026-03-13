SELECT '--------------Single Local------------';

SELECT *
FROM merge(currentDatabase(), 'test_local_1');

SELECT
    *,
    _table
FROM merge(currentDatabase(), 'test_local_1')
ORDER BY _table ASC;

SELECT
    sum(value),
    _table
FROM merge(currentDatabase(), 'test_local_1')
GROUP BY _table
ORDER BY _table ASC;

SELECT *
FROM merge(currentDatabase(), 'test_local_1')
WHERE _table = 'test_local_1';

SELECT *
FROM merge(currentDatabase(), 'test_local_1')
PREWHERE _table = 'test_local_1'; -- { serverError ILLEGAL_PREWHERE }

SELECT *
FROM merge(currentDatabase(), 'test_local_1')
WHERE _table IN ('test_local_1', 'test_local_2');

SELECT *
FROM merge(currentDatabase(), 'test_local_1')
PREWHERE _table IN ('test_local_1', 'test_local_2'); -- { serverError ILLEGAL_PREWHERE }

SELECT *
FROM merge(currentDatabase(), 'test_distributed_1');

SELECT
    *,
    _table
FROM merge(currentDatabase(), 'test_distributed_1')
ORDER BY _table ASC;

SELECT
    sum(value),
    _table
FROM merge(currentDatabase(), 'test_distributed_1')
GROUP BY _table
ORDER BY _table ASC;

SELECT *
FROM merge(currentDatabase(), 'test_distributed_1')
WHERE _table = 'test_local_1';

SELECT *
FROM merge(currentDatabase(), 'test_distributed_1')
PREWHERE _table = 'test_local_1'; -- { serverError ILLEGAL_PREWHERE }

SELECT *
FROM merge(currentDatabase(), 'test_distributed_1')
WHERE _table IN ('test_local_1', 'test_local_2');

SELECT *
FROM merge(currentDatabase(), 'test_distributed_1')
PREWHERE _table IN ('test_local_1', 'test_local_2'); -- { serverError ILLEGAL_PREWHERE }

SELECT *
FROM merge(currentDatabase(), 'test_local_1|test_local_2')
ORDER BY _table ASC;

SELECT
    *,
    _table
FROM merge(currentDatabase(), 'test_local_1|test_local_2')
ORDER BY _table ASC;

SELECT
    sum(value),
    _table
FROM merge(currentDatabase(), 'test_local_1|test_local_2')
GROUP BY _table
ORDER BY _table ASC;

SELECT *
FROM merge(currentDatabase(), 'test_local_1|test_local_2')
WHERE _table = 'test_local_1';

SELECT *
FROM merge(currentDatabase(), 'test_local_1|test_local_2')
PREWHERE _table = 'test_local_1'; -- { serverError ILLEGAL_PREWHERE }

SELECT *
FROM merge(currentDatabase(), 'test_local_1|test_local_2')
WHERE _table IN ('test_local_1', 'test_local_2')
ORDER BY value ASC;

SELECT *
FROM merge(currentDatabase(), 'test_local_1|test_local_2')
PREWHERE _table IN ('test_local_1', 'test_local_2')
ORDER BY value ASC; -- { serverError ILLEGAL_PREWHERE }

SELECT *
FROM merge(currentDatabase(), 'test_local_1|test_distributed_2')
ORDER BY _table ASC;

SELECT
    *,
    _table
FROM merge(currentDatabase(), 'test_local_1|test_distributed_2')
ORDER BY _table ASC;

SELECT
    sum(value),
    _table
FROM merge(currentDatabase(), 'test_local_1|test_distributed_2')
GROUP BY _table
ORDER BY _table ASC;

SELECT *
FROM merge(currentDatabase(), 'test_local_1|test_distributed_2')
WHERE _table = 'test_local_1';

SELECT *
FROM merge(currentDatabase(), 'test_local_1|test_distributed_2')
PREWHERE _table = 'test_local_1'; -- { serverError ILLEGAL_PREWHERE }

SELECT *
FROM merge(currentDatabase(), 'test_local_1|test_distributed_2')
WHERE _table IN ('test_local_1', 'test_local_2')
ORDER BY value ASC;

SELECT *
FROM merge(currentDatabase(), 'test_local_1|test_distributed_2')
PREWHERE _table IN ('test_local_1', 'test_local_2')
ORDER BY value ASC; -- { serverError ILLEGAL_PREWHERE }

SELECT *
FROM merge(currentDatabase(), 'test_distributed_1|test_distributed_2')
ORDER BY _table ASC;

SELECT
    *,
    _table
FROM merge(currentDatabase(), 'test_distributed_1|test_distributed_2')
ORDER BY _table ASC;

SELECT
    sum(value),
    _table
FROM merge(currentDatabase(), 'test_distributed_1|test_distributed_2')
GROUP BY _table
ORDER BY _table ASC;

SELECT *
FROM merge(currentDatabase(), 'test_distributed_1|test_distributed_2')
WHERE _table = 'test_local_1';

SELECT *
FROM merge(currentDatabase(), 'test_distributed_1|test_distributed_2')
PREWHERE _table = 'test_local_1'; -- { serverError ILLEGAL_PREWHERE }

SELECT *
FROM merge(currentDatabase(), 'test_distributed_1|test_distributed_2')
WHERE _table IN ('test_local_1', 'test_local_2')
ORDER BY value ASC;

SELECT *
FROM merge(currentDatabase(), 'test_distributed_1|test_distributed_2')
PREWHERE _table IN ('test_local_1', 'test_local_2')
ORDER BY value ASC; -- { serverError ILLEGAL_PREWHERE }

SELECT *
FROM merge(currentDatabase(), 'test_s64_distributed|test_u64_distributed')
ORDER BY value ASC;

SELECT *
FROM merge(currentDatabase(), 'test_s64_distributed|test_u64_distributed')
WHERE date = '2018-08-01'
ORDER BY value ASC;

SELECT *
FROM merge(currentDatabase(), 'test_s64_distributed|test_u64_distributed')
WHERE _table = 'test_u64_local'
ORDER BY value ASC;

SELECT *
FROM merge(currentDatabase(), 'test_s64_distributed|test_u64_distributed')
WHERE value = 1;