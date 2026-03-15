create table foo(bar String, projection p (select * apply groupUniqArray(100))) engine MergeTree order by bar;
