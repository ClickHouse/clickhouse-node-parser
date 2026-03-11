select distinct(distr1.id) from distr1
where distr1.id in
(
    select distr1.id
    from distr1
    join distr2 on distr1.id = distr2.id
    where distr1.id > 0
);
select distinct(d0.id) from distr1 d0
where d0.id in
(
    select d1.id
    from distr1 as d1
    join distr2 as d2 on d1.id = d2.id
    where d1.id > 0
);
select distinct(distr1.id) from distr1
where distr1.id in
(
   select distr1.id
   from distr1 as d1
   join distr2 as d2 on distr1.id = distr2.id
   where distr1.id > 0
);
