select * from t1_all t1 where t1.a in (select t2.a from t2_all t2);
select t1.* from t1_all t1 join t2_all t2 on t1.a = t2.a ORDER BY t1.a;
