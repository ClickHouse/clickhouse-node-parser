-- Tags: no-fasttest
-- no-fasttest: upper/lowerUTF8 use ICU
SELECT hex(lowerUTF8('�'));

SELECT hex(upperUTF8('�'));