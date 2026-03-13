SELECT
    CounterID,
    dummy
FROM merge_distributed
WHERE dummy <> ''
LIMIT 10;

SELECT
    CounterID,
    dummy1
FROM merge_distributed
WHERE dummy1 <> ''
LIMIT 10; -- { serverError UNKNOWN_IDENTIFIER }