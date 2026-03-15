CREATE TABLE test_rlp
(
    a Int32,
    b Int32
)
ENGINE = MergeTree()
ORDER BY a
SETTINGS index_granularity = 5, index_granularity_bytes = '10Mi';

-- { echoOn }
SELECT
    a,
    c
FROM test_rlp
WHERE c % 2 == 0
    AND b < 5;

CREATE ROW POLICY test_rlp_policy ON test_rlp USING c % 2 == 0 TO default;

SELECT
    a,
    c
FROM test_rlp
WHERE b < 5
SETTINGS optimize_move_to_prewhere = 0;

SELECT
    a,
    c
FROM test_rlp
PREWHERE b < 5;