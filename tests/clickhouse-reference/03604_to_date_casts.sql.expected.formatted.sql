SELECT
    `from`,
    val,
    val::Int32
FROM test_date32_casts
ORDER BY `ALL` ASC;

SELECT
    `from`,
    val,
    val::UInt16
FROM test_date_casts
ORDER BY `ALL` ASC;

SELECT c0
FROM fuzz_71531
ORDER BY c0 ASC;

SELECT c0
FROM fuzz_86799
ORDER BY c0 ASC;