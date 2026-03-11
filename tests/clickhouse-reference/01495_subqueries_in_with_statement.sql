SELECT * FROM (WITH test1 AS (SELECT toInt32(*) i FROM numbers(5)) SELECT * FROM test1) l ANY INNER JOIN test1 r on (l.i == r.i);
select '---------------------------';
