SET enable_analyzer = 1;

CREATE TABLE mv_test
(
    id UInt64,
    ref_id UInt64,
    final_id Nullable(UInt64),
    display String
)
ENGINE = Log;

CREATE TABLE mv_test_target
(
    id UInt64,
    ref_id UInt64,
    final_id Nullable(UInt64),
    display String
)
ENGINE = Log;

CREATE MATERIALIZED VIEW mv_test_mv
TO mv_test_target
(
    id UInt64,
    ref_id UInt64,
    final_id Nullable(UInt64),
    display String
)
AS
WITH tester AS (
    SELECT
        id,
        ref_id,
        final_id,
        display
    FROM mv_test
),

id_set AS (
    SELECT
        display,
        max(id) AS max_id
    FROM mv_test
    GROUP BY display
)

SELECT *
FROM tester
WHERE id IN (
        SELECT max_id
        FROM id_set
    );

SELECT *
FROM mv_test_target;