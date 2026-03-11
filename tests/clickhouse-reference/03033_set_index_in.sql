
select sum(1+ignore(*)) from a where indexHint(v in (20, 40));
select sum(1+ignore(*)) from a where indexHint(v in (select 20 union all select 40 union all select 60));
SELECT 1 FROM a PREWHERE v IN (SELECT 1) WHERE v IN (SELECT 2);
select 1 from a where indexHint(indexHint(materialize(0)));
select sum(1+ignore(*)) from a where indexHint(indexHint(v in (20, 40)));
