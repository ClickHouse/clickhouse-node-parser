SELECT number = '1' FROM numbers(3);
SELECT '---';
SELECT '1' != number FROM numbers(3);
SELECT '1' > number FROM numbers(3);
SELECT 1 = '257';
SELECT 1 IN (1.23, '1', 2);
SELECT 1 IN (1.23, '2', 2);
-- it should work but it doesn't.
SELECT 1 = '1.0'; -- { serverError TYPE_MISMATCH }
SELECT 1 != '257';
SELECT 1 < '257'; -- this is wrong for now
SELECT 1 > '257';
SELECT 1 <= '257'; -- this is wrong for now
SELECT 1 >= '257';
SELECT toDateTime('2020-06-13 01:02:03') = '2020-06-13T01:02:03';
SELECT 0 = ''; -- { serverError ATTEMPT_TO_READ_AFTER_EOF }
