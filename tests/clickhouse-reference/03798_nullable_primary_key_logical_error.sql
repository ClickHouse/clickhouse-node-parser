CREATE TABLE t (`x` FixedString(3), `y` Nullable(Int16)) ENGINE = MergeTree PARTITION BY y ORDER BY x SETTINGS allow_nullable_key = 1;
SELECT DISTINCT minDistinct(toDecimalString(77 IS NOT NULL, isZeroOrNull(toNullable(1) IS NOT NULL))) IGNORE NULLS FROM t;
