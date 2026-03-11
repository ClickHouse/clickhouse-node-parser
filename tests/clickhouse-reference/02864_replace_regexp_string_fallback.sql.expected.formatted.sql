SELECT
    'Hello' AS haystack,
    'l' AS needle,
    'x' AS replacement,
    replaceRegexpOne(materialize(haystack), needle, replacement),
    replaceRegexpAll(materialize(haystack), needle, replacement);

SELECT
    'Hello' AS haystack,
    'l' AS needle,
    '\\1' AS replacement,
    replaceRegexpOne(materialize(haystack), needle, replacement);

SELECT
    'Hello' AS haystack,
    'l' AS needle,
    '\\1' AS replacement,
    replaceRegexpAll(materialize(haystack), needle, replacement);