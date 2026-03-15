-- Tags: no-fasttest

SELECT hex(SHA256(''));
SELECT hex(SHA256('abc'));
CREATE TABLE defaults
(
    s FixedString(20)
)ENGINE = Memory();
SELECT hex(SHA256(s)) FROM defaults;
