create table tab2 (id String, version Int64, l String, accountCode String, z Int32) engine = ReplacingMergeTree(z) PRIMARY KEY (accountCode, id) ORDER BY (accountCode, id, version, l);
set max_threads=2;
select count() from tab2 final;
