-- Tags: no-fasttest
-- no-fasttest: Requires vectorscan
SET allow_hyperscan = 1, max_hyperscan_regexp_length = 0, max_hyperscan_regexp_total_length = 0;

SET optimize_rewrite_like_perfect_affix = 0; -- prevent input/output intereference from another LIKE rewrite pass

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