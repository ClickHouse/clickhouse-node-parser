SELECT
    toFixedString('', 4) AS str,
    empty(str) AS is_empty;

SELECT
    toFixedString('\0abc', 4) AS str,
    empty(str) AS is_empty;

CREATE TABLE defaulted
(
    v6 FixedString(16)
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT
    count(),
    notEmpty(v6) AS e
FROM defaulted
GROUP BY e;