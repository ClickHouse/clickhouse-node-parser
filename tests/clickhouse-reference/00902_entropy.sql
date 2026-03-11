select val < 1.5 and val > 1.459 from (select entropy(vals) as val from defaults);
select val < 2.4 and val > 2.3393 from (select entropy(vals) as val from defaults);
select val < 2.189 and val > 2.1886 from (select entropy(vals) as val from defaults);
