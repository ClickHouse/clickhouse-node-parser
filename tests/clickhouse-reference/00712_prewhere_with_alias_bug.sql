create table prewhere_alias (a Int32, b Int32, c alias a + b) engine = MergeTree order by b;
select a, c + toInt32(1), (c + toInt32(1)) * 2 from prewhere_alias prewhere (c + toInt32(1)) * 2 = 6;
