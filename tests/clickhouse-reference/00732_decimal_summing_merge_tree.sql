set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE decimal_sum
(
    date Date,
    sum32 Decimal32(4),
    sum64 Decimal64(8),
    sum128 Decimal128(10)
) Engine = SummingMergeTree(date, (date), 8192);
SELECT * FROM decimal_sum;
