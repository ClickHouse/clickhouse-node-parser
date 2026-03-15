set allow_deprecated_syntax_for_merge_tree=1;
create table tab (date Date,  time DateTime, data String) ENGINE = MergeTree(date, (time, data), 8192);
select time FROM remote('127.0.0.{1,2}', currentDatabase(), tab)  WHERE date = '2018-01-21' limit 2;
