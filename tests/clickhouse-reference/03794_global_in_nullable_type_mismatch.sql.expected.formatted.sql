-- Test GLOBAL IN with nullable subquery (materialize(toNullable(...)))
-- This used to crash because when building external table from a ready set,
-- the set elements (non-nullable) were written directly without converting
-- them to match the external table's expected Nullable types.
SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT materialize(toNullable(42)) + number
        FROM numbers(1)
    );

-- Additional test cases
SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.1', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT toNullable(number)
        FROM numbers(5)
    );