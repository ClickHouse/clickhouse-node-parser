CREATE TABLE mt1 (id UInt64) ENGINE = MergeTree ORDER BY id;
CREATE TABLE mt2 (id UInt64) ENGINE = MergeTree ORDER BY id;
CREATE TABLE merge (id UInt64) ENGINE = Merge(currentDatabase(), '^mt[0-9]+$');
SET apply_mutations_on_fly = 0;
SET apply_patch_parts = 0;
SELECT count() FROM merge;
CREATE TABLE mt3 (id UInt64) ENGINE = TinyLog;
