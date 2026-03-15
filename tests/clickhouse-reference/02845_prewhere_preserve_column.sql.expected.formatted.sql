SET move_all_conditions_to_prewhere = 1;

CREATE TABLE `02845_prewhere`
(
    e String,
    c String,
    q String
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM (
        SELECT *
        FROM `02845_prewhere`
        WHERE e = '5'
            OR q = '6'
    )
WHERE (q = '6');