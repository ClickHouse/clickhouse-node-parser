SELECT *
FROM mult_tab FINAL
ORDER BY
    date ASC,
    value ASC,
    sign ASC;

SELECT *
FROM mult_tab;

SELECT '-------------------------';

SELECT *
FROM mult_tab FINAL
ORDER BY
    date ASC,
    value ASC,
    version ASC,
    sign ASC;

SELECT
    date,
    value,
    version,
    sign
FROM mult_tab FINAL
ORDER BY
    date ASC,
    key ASC,
    sign ASC
SETTINGS max_block_size = 33;

SELECT
    date,
    value,
    version,
    sign
FROM mult_tab;