select * from (select [1, 2] a) aa cross join (select [3, 4] b) bb array join aa.a, bb.b;
