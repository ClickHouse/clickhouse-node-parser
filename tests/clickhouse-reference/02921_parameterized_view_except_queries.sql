select '--- Data ---';
SELECT * FROM users order by uid;
--check
select {a1: Int32}, {a2: Int32}, {a3: Int32}, {a4: Int32};
SELECT * FROM V_DELTA(a1=10, a2=50, a3=10, a4=40);
-- check individual query before the next part
select distinct uid from 
(
select uid, name, age from users
where age >= {a1: Int32} AND age <= {a2: Int32}
EXCEPT
select uid, name, age from users
where age >= {a3: Int32} AND age <= {a4: Int32}
)
order by uid;
