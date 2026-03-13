SELECT
    t1_00816.a,
    t2_00816.a
FROM
    t1_00816
INNER JOIN t2_00816
    ON t1_00816.a = t2_00816.a;

-- Received exception from server (version 18.14.1):
-- Code: 47. DB::Exception: Received from localhost:9000, 127.0.0.1. DB::Exception: Unknown identifier: t2_00816.a.
-- this query works fine
SELECT
    t1_00816.a,
    t2_00816.*
FROM
    t1_00816
INNER JOIN t2_00816
    ON t1_00816.a = t2_00816.a;

-- and this
SELECT
    t1_00816.a,
    t2_00816.val
FROM
    t1_00816
INNER JOIN t2_00816
    ON t1_00816.a = t2_00816.a;