DROP TABLE IF EXISTS eligible_test;

DROP TABLE IF EXISTS eligible_test2;

-- enable query cache session-wide but also force it individually in each of below statements
SET use_query_cache = true;

SET query_cache_system_table_handling = 'save';

-- check that SELECT statements create entries in the query cache ...
SELECT 1
SETTINGS use_query_cache = true;

SELECT COUNT(*)
FROM `system`.query_cache;

-- ... and all other statements also should not create entries:
-- CREATE
CREATE TABLE eligible_test
(
    a String
)
ENGINE = MergeTree
ORDER BY a; --  SETTINGS use_query_cache = true; -- SETTINGS rejected as unknown

-- ALTER
ALTER TABLE eligible_test ADD COLUMN b String SETTINGS use_query_cache = true;

-- INSERT
INSERT INTO eligible_test; -- SETTINGS use_query_cache = true; -- SETTINGS rejected as unknown

INSERT INTO eligible_test SELECT *
FROM eligible_test
SETTINGS use_query_cache = true;

DROP TABLE eligible_test2;