select
    count(*)
  from
    t5 as ref_2
      left outer join (select
            ref_3.c_2_c48_2 as c_6_c185_6
          from
            t4 as ref_3
          ) as subq_1
      on (ref_2.c52 = subq_1.c_6_c185_6 )
  where intExp2(ref_2.pkey) <= 
      (case when ((subq_1.c_6_c185_6 = 1) and (not (subq_1.c_6_c185_6 = 1))) then 0 else hiveHash(ref_2.c56) end);
select
    count(*)
  from
    t5 as ref_2
      left outer join (select
            ref_3.c_2_c48_2 as c_6_c185_6
          from
            t4 as ref_3
          ) as subq_1
      on (ref_2.c52 = subq_1.c_6_c185_6 )
  where intExp2(ref_2.pkey) <= hiveHash(ref_2.c56);
