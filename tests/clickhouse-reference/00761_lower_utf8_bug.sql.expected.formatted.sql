-- Tags: no-fasttest
-- no-fasttest: upper/lowerUTF8 use ICU
SELECT lowerUTF8('�') = lowerUTF8('�');