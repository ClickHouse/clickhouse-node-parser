DROP TABLE IF EXISTS test_max_mt_projections_alter;

CREATE TABLE test_max_mt_projections_alter
(
    c1 UInt32,
    c2 UInt32,
    c3 UInt32
)
ENGINE = MergeTree
ORDER BY c1
SETTINGS max_projections = 3;

ALTER TABLE test_max_mt_projections_alter ADD PROJECTION p1 (SELECT c2
ORDER BY c2 ASC);

ALTER TABLE test_max_mt_projections_alter ADD PROJECTION p2 (SELECT c3
ORDER BY c3 ASC);

ALTER TABLE test_max_mt_projections_alter ADD PROJECTION p3 (SELECT
    c1,
    c2
ORDER BY
    c1 ASC,
    c2 ASC);

ALTER TABLE test_max_mt_projections_alter ADD PROJECTION p4 (SELECT
    c2,
    c3
ORDER BY
    c2 ASC,
    c3 ASC); -- { serverError LIMIT_EXCEEDED }

ALTER TABLE test_max_mt_projections_alter DROP PROJECTION p3;

DROP TABLE IF EXISTS test_max_mt_projections_create;

CREATE TABLE test_max_mt_projections_create
(
    c1 UInt32,
    c2 UInt32,
    PROJECTION p1 (    SELECT
        c1,
        c2
    ORDER BY c2 ASC),
    PROJECTION p2 (    SELECT c2
    ORDER BY c2 ASC)
)
ENGINE = MergeTree
ORDER BY c1
SETTINGS max_projections = 1; -- { serverError LIMIT_EXCEEDED }

CREATE TABLE test_max_mt_projections_create
(
    c1 UInt32,
    c2 UInt32,
    PROJECTION p (    SELECT
        c1,
        c2
    ORDER BY c2 ASC)
)
ENGINE = MergeTree
ORDER BY c1
SETTINGS max_projections = 0; -- { serverError LIMIT_EXCEEDED }

CREATE TABLE test_max_mt_projections_create
(
    c1 UInt32,
    c2 UInt32,
    PROJECTION p (    SELECT
        c1,
        c2
    ORDER BY c2 ASC)
)
ENGINE = MergeTree
ORDER BY c1
SETTINGS max_projections = 1;

ALTER TABLE test_max_mt_projections_create ADD PROJECTION p2 (SELECT c2
ORDER BY c2 ASC); -- { serverError LIMIT_EXCEEDED }