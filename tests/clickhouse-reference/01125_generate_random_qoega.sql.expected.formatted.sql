SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE mass_table_117
(
    dt Date,
    site_id Int32,
    site_key String
)
ENGINE = MergeTree(dt, (site_id, site_key, dt), 8192);

SELECT
    count(),
    sum(cityHash64(*))
FROM mass_table_117;