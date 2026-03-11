select count() from distr as l global all left join distr as r on l.a = r.a;
