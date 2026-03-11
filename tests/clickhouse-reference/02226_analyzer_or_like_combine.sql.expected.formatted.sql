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