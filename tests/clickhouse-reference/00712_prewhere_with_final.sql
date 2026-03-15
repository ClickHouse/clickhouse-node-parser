set allow_deprecated_syntax_for_merge_tree=1;
create table trepl(d Date,a Int32, b Int32) engine = ReplacingMergeTree(d, (a,b), 8192);
select b from trepl FINAL prewhere a < 1000;
create table versioned_collapsing(d Date, x UInt32, sign Int8, version UInt32) engine = VersionedCollapsingMergeTree(d, x, 8192, sign, version);
select x from versioned_collapsing FINAL prewhere version < 1000;
