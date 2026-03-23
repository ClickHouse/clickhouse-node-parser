SYSTEM DROP  TABLE IF EXISTS f;

SYSTEM DROP  TABLE IF EXISTS v;

CREATE TABLE f
(
    s String
)
ENGINE = File(TSV, '/dev/null');

CREATE VIEW v
AS
(SELECT *
FROM f);

SELECT *
FROM v; -- was failing long time ago

SELECT *
FROM merge('', 'f'); -- was failing long time ago

SYSTEM DROP  TABLE f;

SYSTEM DROP  TABLE v;