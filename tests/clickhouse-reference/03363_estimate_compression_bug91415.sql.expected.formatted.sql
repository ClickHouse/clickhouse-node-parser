CREATE TABLE t0
(
    c0 Int
)
ENGINE = Memory;

INSERT INTO t0 (c0);

SELECT estimateCompressionRatio(c0) OVER (ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
FROM t0
SETTINGS use_variant_as_common_type = 1;