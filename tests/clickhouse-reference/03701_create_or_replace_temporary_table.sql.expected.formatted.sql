CREATE OR REPLACE TEMPORARY TABLE tmp
(
    n UInt32
) AS
SELECT *
FROM numbers(10);

SELECT *
FROM tmp;

REPLACE TEMPORARY TABLE tmp
(
    s String
) AS
SELECT 'a'
FROM numbers(10);

CREATE OR REPLACE TEMPORARY TABLE tmp
(
    n UInt32,
    s String
) AS
SELECT
    number,
    'a'
FROM numbers(10);

DROP TEMPORARY TABLE tmp;

ATTACH TABLE tmp; -- { serverError SYNTAX_ERROR }

DETACH TABLE tmp; -- { serverError SYNTAX_ERROR }