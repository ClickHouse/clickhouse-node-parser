select
    ref_0.c11 as c_2_c30_0
  from
    t2 as ref_0
      cross join (select
            ref_1.c3 as c_6_c28_15
          from
            t1 as ref_1
       ) as subq_0
  where subq_0.c_6_c28_15 = (select c11 from t2 order by c11 limit 1);
