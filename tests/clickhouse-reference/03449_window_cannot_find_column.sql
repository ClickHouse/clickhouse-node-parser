create table t0 (vkey UInt32, primary key(vkey)) engine = MergeTree;
create view t3 as 
select distinct 
    ref_0.vkey as c_2_c16_0
  from 
    t0 as ref_0;
