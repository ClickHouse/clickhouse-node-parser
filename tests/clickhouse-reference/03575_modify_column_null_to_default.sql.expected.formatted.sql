DROP TABLE IF EXISTS nullable_test;

CREATE TABLE nullable_test
(
    my_int_nullable Nullable(UInt32),
    my_int_nullable_with_default Nullable(UInt32) DEFAULT NULL,
    my_int_nullable_with_default2 Nullable(UInt32) DEFAULT 11,
    my_text_lc_nullable LowCardinality(Nullable(String))
)
ORDER BY tuple();

INSERT INTO nullable_test;

-- { echoOn }
SELECT *
FROM nullable_test
ORDER BY `ALL` ASC;