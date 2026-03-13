-- Validates that a very large/high-frequency posting list is decoded correctly by checking the count in the compressed table matches the uncompressed baseline.
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

-- Tests the block-boundary case (expected 129 hits, i.e. one full 128-value block plus a 1-value tail) and verifies compressed vs uncompressed counts are identical.
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

-- Tests a medium-length, non-aligned posting list (expected 1003 hits) to cover multi-block + non-trivial tail handling; also checks equality with the uncompressed table.
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

-- Tests the single-element posting list case (expected 1 hit) and ensures compressed and uncompressed results match.
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

-- Tests a very small/sparse posting list (expected 2 hits) and checks compressed equals uncompressed.
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

-- Tests another small-N posting list (expected 5 hits) to cover additional short-list behavior; also checks compressed equals uncompressed.
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