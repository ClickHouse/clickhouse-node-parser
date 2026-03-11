SELECT
    (
        SELECT count()
        FROM tab_uncompressed
        WHERE hasToken(str, 'aa')
    ) AS count_uncompressed,
    (
        SELECT count()
        FROM tab_bitpacking
        WHERE hasToken(str, 'aa')
    ) AS count_bitpacking,
    (count_bitpacking = count_uncompressed) AS ok_aa;

SELECT
    (
        SELECT count()
        FROM tab_bitpacking
        WHERE hasToken(str, 'tail129')
    ) AS count_bitpacking,
    (
        SELECT count()
        FROM tab_uncompressed
        WHERE hasToken(str, 'tail129')
    ) AS count_uncompressed,
    count_bitpacking,
    count_uncompressed,
    (count_bitpacking = 129) AS ok_tail129,
    (count_bitpacking = count_uncompressed) AS ok_tail129_eq;

SELECT
    (
        SELECT count()
        FROM tab_bitpacking
        WHERE hasToken(str, 'mid1003')
    ) AS count_bitpacking,
    (
        SELECT count()
        FROM tab_uncompressed
        WHERE hasToken(str, 'mid1003')
    ) AS count_uncompressed,
    (count_bitpacking = 1003) AS ok_mid1003,
    (count_bitpacking = count_uncompressed) AS ok_mid1003_eq;

SELECT
    (
        SELECT count()
        FROM tab_bitpacking
        WHERE hasToken(str, 'single')
    ) AS count_bitpacking,
    (
        SELECT count()
        FROM tab_uncompressed
        WHERE hasToken(str, 'single')
    ) AS count_uncompressed,
    (count_bitpacking = 1) AS ok_single,
    (count_bitpacking = count_uncompressed) AS ok_single_eq;

SELECT
    (
        SELECT count()
        FROM tab_bitpacking
        WHERE hasToken(str, 'rare2')
    ) AS count_bitpacking,
    (
        SELECT count()
        FROM tab_uncompressed
        WHERE hasToken(str, 'rare2')
    ) AS count_uncompressed,
    (count_bitpacking = 2) AS ok_rare2,
    (count_bitpacking = count_uncompressed) AS ok_rare2_eq;

SELECT
    (
        SELECT count()
        FROM tab_bitpacking
        WHERE hasToken(str, 'rare5')
    ) AS count_bitpacking,
    (
        SELECT count()
        FROM tab_uncompressed
        WHERE hasToken(str, 'rare5')
    ) AS count_uncompressec,
    (count_bitpacking = 5) AS ok_rare5,
    (count_bitpacking = count_uncompressec) AS ok_rare5_eq;