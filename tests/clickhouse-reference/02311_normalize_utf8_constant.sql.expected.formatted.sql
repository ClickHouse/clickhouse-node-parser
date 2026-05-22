-- Tags: no-fasttest
SELECT
    'â' AS s,
    normalizeUTF8NFC(s) AS s1,
    normalizeUTF8NFD(s) AS s2,
    normalizeUTF8NFKC(s) AS s3,
    normalizeUTF8NFKD(s) AS s4,
    hex(s),
    hex(s1),
    hex(s2),
    hex(s3),
    hex(s4);