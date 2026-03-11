select a from (select (1, 2) as a) js1 any inner join (select (1, 2) as a) js2 using a;
