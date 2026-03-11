-- Tags: no-fasttest

SELECT hex(SHA256(''));
SELECT hex(SHA256('abc'));
SELECT hex(SHA256(s)) FROM defaults;
