set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE mass_table_312 (d Date DEFAULT '2000-01-01', x UInt64, n Nested(a String, b String)) ENGINE = MergeTree(d, x, 1);
SELECT count(), sum(cityHash64(*)) FROM mass_table_312;
SELECT count(), sum(cityHash64(*)) FROM mass_table_312 ARRAY JOIN n;
