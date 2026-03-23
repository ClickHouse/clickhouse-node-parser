DROP TABLE IF EXISTS m;

CREATE TABLE m
(
    a int
)
ENGINE = Log;

INSERT INTO m;

SET enable_analyzer = true, optimize_rewrite_sum_if_to_count_if = 1;

DROP TABLE m;