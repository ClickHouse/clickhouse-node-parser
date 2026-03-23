SYSTEM drop  table if exists tab;

CREATE TABLE tab
(
    id UInt32,
    haystack String,
    pattern String
)
ENGINE = MergeTree()
ORDER BY id;

INSERT INTO tab;

SELECT countSubstrings('aaaxxxaa\0xxx', pattern)
FROM tab
WHERE id = 1;

SELECT countSubstringsCaseInsensitive('aaaxxxaa\0xxx', pattern)
FROM tab
WHERE id = 1;

SELECT countSubstringsCaseInsensitiveUTF8('aaaxxxaa\0xxx', pattern)
FROM tab
WHERE id = 1;

SELECT countSubstrings(haystack, pattern)
FROM tab
WHERE id = 1;

SELECT countSubstringsCaseInsensitive(haystack, pattern)
FROM tab
WHERE id = 1;

SELECT countSubstringsCaseInsensitiveUTF8(haystack, pattern)
FROM tab
WHERE id = 1;

INSERT INTO tab;

SELECT position('aaaaa\0x', pattern)
FROM tab
WHERE id = 2;

SELECT positionCaseInsensitive('aaaaa\0x', pattern)
FROM tab
WHERE id = 2;

SELECT positionCaseInsensitiveUTF8('aaaaa\0x', pattern)
FROM tab
WHERE id = 2;

SELECT position(haystack, pattern)
FROM tab
WHERE id = 2;

SELECT positionCaseInsensitive(haystack, pattern)
FROM tab
WHERE id = 2;

SELECT positionCaseInsensitiveUTF8(haystack, pattern)
FROM tab
WHERE id = 2;