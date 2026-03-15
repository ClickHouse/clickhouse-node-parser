set optimize_use_projections = 1;
create table x (pk int, arr Array(int), projection p (select arr order by pk)) engine MergeTree order by tuple();
select a from x array join arr as a;
