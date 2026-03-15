set join_use_nulls =  1;
create table t0 (c2 String, primary key(c2)) engine = MergeTree;
create table t1 (vkey UInt32, c8 String, primary key(vkey))engine = MergeTree;
create view t4 as 
select     
    ref_1.vkey as c_2_c48_2
  from 
    t0 as ref_0
      left outer join t1 as ref_1
      on (ref_0.c2 = ref_1.c8) ;
create table t5 (pkey UInt32, c52 UInt32, c56 String, primary key(pkey))engine = MergeTree;
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
