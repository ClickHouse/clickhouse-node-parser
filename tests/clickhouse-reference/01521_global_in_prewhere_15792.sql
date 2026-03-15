create table xp(A Date, B Int64, S String) Engine=MergeTree partition by toYYYYMM(A) order by B;
create table xp_d as xp Engine=Distributed(test_shard_localhost, currentDatabase(), xp);
select count() from xp_d prewhere toYYYYMM(A) global in (select toYYYYMM(min(A)) from xp_d) where B > -1;
