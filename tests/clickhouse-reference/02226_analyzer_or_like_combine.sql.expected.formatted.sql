-- Tags: no-fasttest
-- no-fasttest: Requires vectorscan
SET allow_hyperscan = 1, max_hyperscan_regexp_length = 0, max_hyperscan_regexp_total_length = 0;

SET optimize_rewrite_like_perfect_affix = 0; -- prevent input/output intereference from another LIKE rewrite pass

EXPLAIN SYNTAX
SELECT materialize('Привет, World') AS s
WHERE (like(s, 'hell%'))
    OR (ilike(s, '%привет%'))
    OR (ilike(s, 'world%'))
SETTINGS optimize_or_like_chain = 0;

EXPLAIN QUERY TREE run_passes = 1
SELECT materialize('Привет, World') AS s
WHERE (like(s, 'hell%'))
    OR (ilike(s, '%привет%'))
    OR (ilike(s, 'world%'))
SETTINGS
    optimize_or_like_chain = 0,
    enable_analyzer = 1;

EXPLAIN SYNTAX
SELECT materialize('Привет, World') AS s
WHERE (like(s, 'hell%'))
    OR (ilike(s, '%привет%'))
    OR (ilike(s, 'world%'))
SETTINGS optimize_or_like_chain = 1;

EXPLAIN QUERY TREE run_passes = 1
SELECT materialize('Привет, World') AS s
WHERE (like(s, 'hell%'))
    OR (ilike(s, '%привет%'))
    OR (ilike(s, 'world%'))
SETTINGS
    optimize_or_like_chain = 1,
    enable_analyzer = 1;

EXPLAIN SYNTAX
SELECT
    materialize('Привет, World') AS s1,
    materialize('Привет, World') AS s2
WHERE (like(s1, 'hell%'))
    OR (ilike(s2, '%привет%'))
    OR (ilike(s1, 'world%'))
SETTINGS optimize_or_like_chain = 1;

EXPLAIN SYNTAX
SELECT
    materialize('Привет, World') AS s1,
    materialize('Привет, World') AS s2
WHERE (like(s1, 'hell%'))
    OR (ilike(s2, '%привет%'))
    OR (ilike(s1, 'world%'))
SETTINGS
    optimize_or_like_chain = 1,
    allow_hyperscan = 0;

EXPLAIN SYNTAX
SELECT
    materialize('Привет, World') AS s1,
    materialize('Привет, World') AS s2
WHERE (like(s1, 'hell%'))
    OR (ilike(s2, '%привет%'))
    OR (ilike(s1, 'world%'))
SETTINGS
    optimize_or_like_chain = 1,
    max_hyperscan_regexp_length = 10;

EXPLAIN SYNTAX
SELECT
    materialize('Привет, World') AS s1,
    materialize('Привет, World') AS s2
WHERE (like(s1, 'hell%'))
    OR (ilike(s2, '%привет%'))
    OR (ilike(s1, 'world%'))
SETTINGS
    optimize_or_like_chain = 1,
    max_hyperscan_regexp_total_length = 10;

EXPLAIN SYNTAX
SELECT
    materialize('Привет, World') AS s1,
    materialize('Привет, World') AS s2
WHERE (like(s1, 'hell%'))
    OR (ilike(s2, '%привет%'))
    OR (ilike(s1, 'world%'))
    OR s1 == 'Привет'
SETTINGS optimize_or_like_chain = 1;

SELECT materialize('Привет, optimized World') AS s
WHERE (like(s, 'hell%'))
    OR (like(s, '%привет%'))
    OR (ilike(s, '%world'))
SETTINGS optimize_or_like_chain = 1;

SELECT materialize('Привет, optimized World') AS s
WHERE (like(s, 'hell%'))
    OR (like(s, '%привет%'))
    OR (ilike(s, '%world'))
SETTINGS
    optimize_or_like_chain = 1,
    enable_analyzer = 1;

SELECT materialize('Привет, World') AS s
WHERE (like(s, 'hell%'))
    OR (like(s, '%привет%'))
    OR (ilike(s, '%world'))
SETTINGS optimize_or_like_chain = 0;

SELECT materialize('Привет, World') AS s
WHERE (like(s, 'hell%'))
    OR (like(s, '%привет%'))
    OR (ilike(s, '%world'))
SETTINGS
    optimize_or_like_chain = 0,
    enable_analyzer = 1;

SELECT materialize('Привет, optimized World') AS s
WHERE (like(s, 'hell%'))
    OR (ilike(s, '%привет%'))
    OR (like(s, 'world%'))
SETTINGS optimize_or_like_chain = 1;

SELECT materialize('Привет, optimized World') AS s
WHERE (like(s, 'hell%'))
    OR (ilike(s, '%привет%'))
    OR (like(s, 'world%'))
SETTINGS
    optimize_or_like_chain = 1,
    enable_analyzer = 1;

SELECT materialize('Привет, World') AS s
WHERE (like(s, 'hell%'))
    OR (ilike(s, '%привет%'))
    OR (like(s, 'world%'))
SETTINGS optimize_or_like_chain = 0;

SELECT materialize('Привет, World') AS s
WHERE (like(s, 'hell%'))
    OR (ilike(s, '%привет%'))
    OR (like(s, 'world%'))
SETTINGS
    optimize_or_like_chain = 0,
    enable_analyzer = 1;

SELECT materialize('Привет, World') AS s
WHERE (like(s, 'hell%'))
    OR (ilike(s, '%привет%'))
    OR (ilike(s, 'world%'))
SETTINGS
    optimize_or_like_chain = 1,
    enable_analyzer = 1;

-- Aliases
EXPLAIN SYNTAX
SELECT
    test,
    materialize('Привет, World') AS s
WHERE (((like(s, 'hell%')) AS test))
    OR (ilike(s, '%привет%'))
    OR (ilike(s, 'world%'))
SETTINGS optimize_or_like_chain = 1;