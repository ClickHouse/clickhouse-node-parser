select count() from t1 where c1 in (select 'BBBBBB' union all select null);
select count() from t1 where cast(c1 as Nullable(String)) in (select 'BBBBBB' union all select null);
