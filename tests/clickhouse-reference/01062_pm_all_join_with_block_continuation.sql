SELECT count(1) FROM (
    SELECT materialize(1) as k, n FROM numbers(10) nums
    JOIN (SELECT materialize(1) AS k, number n FROM numbers(1000000)) j
    USING k);
SELECT count(1) FROM (
    SELECT materialize(1) as k, n FROM numbers(1000) nums
    JOIN (SELECT materialize(1) AS k, number n FROM numbers(10000)) j
    USING k);
SELECT count(1), uniqExact(n) FROM (
    SELECT materialize(1) as k, n FROM numbers(1000000) nums
    JOIN (SELECT materialize(1) AS k, number n FROM numbers(10)) j
    USING k);
-- Because of the optimizations in the analyzer the following queries started to run without issues. To keep the essence of the test, we test both cases.
SELECT count(1) FROM (
    SELECT materialize(1) as k, n FROM numbers(10) nums
    JOIN (SELECT materialize(1) AS k, number n FROM numbers(1000000)) j
    USING k) SETTINGS enable_analyzer = 0; -- { serverError MEMORY_LIMIT_EXCEEDED }
SELECT count(1) FROM (
    SELECT materialize(1) as k, n FROM numbers(1000) nums
    JOIN (SELECT materialize(1) AS k, number n FROM numbers(10000)) j
    USING k) SETTINGS enable_analyzer = 0; -- { serverError MEMORY_LIMIT_EXCEEDED }
SELECT count(1) FROM (
    SELECT materialize(1) as k, n FROM numbers(10) nums
    JOIN (SELECT materialize(1) AS k, number n FROM numbers(1000000)) j
    USING k) SETTINGS enable_analyzer = 1;
SELECT count(1) FROM (
    SELECT materialize(1) as k, n FROM numbers(1000) nums
    JOIN (SELECT materialize(1) AS k, number n FROM numbers(10000)) j
    USING k) SETTINGS enable_analyzer = 1;
SELECT count(1), uniqExact(n) FROM (
    SELECT materialize(1) as k, n FROM numbers(1000) nums
    JOIN (SELECT materialize(1) AS k, number n FROM numbers(10000)) j
    USING k);
