CREATE TABLE test_max_mt_projections_alter (c1 UInt32, c2 UInt32, c3 UInt32)
        ENGINE = MergeTree ORDER BY c1
        SETTINGS max_projections = 3;
CREATE TABLE test_max_mt_projections_create (c1 UInt32, c2 UInt32,
        PROJECTION p1 (SELECT c1, c2 ORDER BY c2),
        PROJECTION p2 (SELECT c2 ORDER BY c2))
        ENGINE = MergeTree ORDER BY c1
        SETTINGS max_projections = 1; -- { serverError LIMIT_EXCEEDED }
CREATE TABLE test_max_mt_projections_create (c1 UInt32, c2 UInt32,
        PROJECTION p (SELECT c1, c2 ORDER BY c2))
        ENGINE = MergeTree ORDER BY c1
        SETTINGS max_projections = 0; -- { serverError LIMIT_EXCEEDED }
CREATE TABLE test_max_mt_projections_create (c1 UInt32, c2 UInt32,
        PROJECTION p (SELECT c1, c2 ORDER BY c2))
        ENGINE = MergeTree ORDER BY c1
        SETTINGS max_projections = 1;
