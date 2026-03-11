SELECT match('a key="v" ', 'key="(.*?)"');

SELECT match(materialize('a key="v" '), 'key="(.*?)"');

SELECT match('\0 key="v" ', 'key="(.*?)"');

SELECT match(materialize('\0 key="v" '), 'key="(.*?)"');

SELECT multiMatchAny('\0 key="v" ', ['key="(.*?)"']);

SELECT multiMatchAny(materialize('\0 key="v" '), ['key="(.*?)"']);

SELECT
    concat(unhex('34'), ' key="v" ') AS haystack,
    length(haystack),
    extract(haystack, 'key="(.*?)"') AS needle;

SELECT
    concat(unhex('00'), ' key="v" ') AS haystack,
    length(haystack),
    extract(haystack, 'key="(.*?)"') AS needle;

SELECT
    number AS char_code,
    extract(concat(char(char_code), ' key="v" ') AS haystack, 'key="(.*?)"') AS needle
FROM numbers(256);