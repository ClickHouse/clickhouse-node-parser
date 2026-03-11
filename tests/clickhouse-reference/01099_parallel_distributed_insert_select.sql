SELECT * FROM distributed_01099_b;
SELECT number, count(number) FROM local_01099_b group by number order by number;
SELECT number, count(number) FROM distributed_01099_b group by number order by number;
SELECT * FROM distributed_01099_c;
