-- Tags: no-cpu-ppc64le
-- Tag no-cpu-ppc64le: Depending on the target platform, CRC32C function returns different hash values. So, should not run on PowerPC. Whenever a new test gets added here, same has to be updated in 01016_simhash_minhash_ppc.sql
SELECT ngramSimHash('');

SELECT ngramSimHash('what a cute cat.');

SELECT ngramSimHashCaseInsensitive('what a cute cat.');

SELECT ngramSimHashUTF8('what a cute cat.');

SELECT ngramSimHashCaseInsensitiveUTF8('what a cute cat.');

SELECT wordShingleSimHash('what a cute cat.');

SELECT wordShingleSimHashCaseInsensitive('what a cute cat.');

SELECT wordShingleSimHashUTF8('what a cute cat.');

SELECT wordShingleSimHashCaseInsensitiveUTF8('what a cute cat.');

SELECT ngramMinHash('');

SELECT ngramMinHash('what a cute cat.');

SELECT ngramMinHashCaseInsensitive('what a cute cat.');

SELECT ngramMinHashUTF8('what a cute cat.');

SELECT ngramMinHashCaseInsensitiveUTF8('what a cute cat.');

SELECT wordShingleMinHash('what a cute cat.');

SELECT wordShingleMinHashCaseInsensitive('what a cute cat.');

SELECT wordShingleMinHashUTF8('what a cute cat.');

SELECT wordShingleMinHashCaseInsensitiveUTF8('what a cute cat.');

CREATE TABLE defaults
(
    s String
)
ENGINE = Memory();

SELECT ngramSimHash(s)
FROM defaults;

SELECT ngramSimHashCaseInsensitive(s)
FROM defaults;

SELECT ngramSimHashUTF8(s)
FROM defaults;

SELECT ngramSimHashCaseInsensitiveUTF8(s)
FROM defaults;

SELECT wordShingleSimHash(s)
FROM defaults;

SELECT wordShingleSimHashCaseInsensitive(s)
FROM defaults;

SELECT wordShingleSimHashUTF8(s)
FROM defaults;

SELECT wordShingleSimHashCaseInsensitiveUTF8(s)
FROM defaults;

SELECT ngramMinHash(s)
FROM defaults;

SELECT ngramMinHashCaseInsensitive(s)
FROM defaults;

SELECT ngramMinHashUTF8(s)
FROM defaults;

SELECT ngramMinHashCaseInsensitiveUTF8(s)
FROM defaults;

SELECT wordShingleMinHash(s)
FROM defaults;

SELECT wordShingleMinHashCaseInsensitive(s)
FROM defaults;

SELECT wordShingleMinHashUTF8(s)
FROM defaults;

SELECT wordShingleMinHashCaseInsensitiveUTF8(s)
FROM defaults;

SELECT
    'uniqExact',
    uniqExact(s)
FROM defaults;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    ngramSimHash(s) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    ngramSimHashCaseInsensitive(s) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    ngramSimHashUTF8(s) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    ngramSimHashCaseInsensitiveUTF8(s) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    wordShingleSimHash(s, 2) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    wordShingleSimHashCaseInsensitive(s, 2) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    wordShingleSimHashUTF8(s, 2) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    wordShingleSimHashCaseInsensitiveUTF8(s, 2) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    ngramMinHash(s) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    ngramMinHashCaseInsensitive(s) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    ngramMinHashUTF8(s) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    ngramMinHashCaseInsensitiveUTF8(s) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    wordShingleMinHash(s, 2, 3) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    wordShingleMinHashCaseInsensitive(s, 2, 3) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    wordShingleMinHashUTF8(s, 2, 3) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT
    arrayStringConcat(groupArray(s), '\n:::::::\n'),
    count(),
    wordShingleMinHashCaseInsensitiveUTF8(s, 2, 3) AS h
FROM defaults
GROUP BY h
ORDER BY h ASC;

SELECT wordShingleSimHash('foobar', 9223372036854775807); -- { serverError ARGUMENT_OUT_OF_BOUND }

SELECT wordShingleSimHash('foobar', 1001); -- { serverError ARGUMENT_OUT_OF_BOUND }

SELECT wordShingleSimHash('foobar', 0); -- { serverError ARGUMENT_OUT_OF_BOUND }