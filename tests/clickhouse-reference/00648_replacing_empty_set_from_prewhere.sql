set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE final_test (id String, version Date) ENGINE = ReplacingMergeTree(version, id, 8192);
SELECT * FROM final_test FINAL PREWHERE id == '2018-01-02';
