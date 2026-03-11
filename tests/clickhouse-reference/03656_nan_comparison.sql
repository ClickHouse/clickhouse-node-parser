SELECT
(
select count(*) 
from t7 as ref_0
where ref_0.c57 <> (case when 1 = 1 then nan else ref_0.c57 end)
)
=
(
select count(*) 
from t7 as ref_0
where ref_0.c57 <> nan
);
