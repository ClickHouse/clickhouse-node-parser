SELECT
    'Disabled',
    *
FROM account_test FINAL
WHERE id = 11338881281426660955
SETTINGS split_parts_ranges_into_intersecting_and_non_intersecting_final = 0;

SELECT
    'Enabled',
    *
FROM account_test FINAL
WHERE id = 11338881281426660955
SETTINGS split_parts_ranges_into_intersecting_and_non_intersecting_final = 1;