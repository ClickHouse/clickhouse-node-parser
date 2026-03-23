CREATE TABLE row_level_policy_prewhere
(
    x Int16,
    y String
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO row_level_policy_prewhere (y, x);

CREATE ROW POLICY row_level_policy_prewhere_policy0 ON row_level_policy_prewhere USING x >= 0 TO default;

SELECT *
FROM row_level_policy_prewhere
PREWHERE y = 'foo';