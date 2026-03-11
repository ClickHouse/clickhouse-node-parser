select number as a, number+1 as b from remote('127.0.0.{1,2}', numbers_mt(1e5)) group by grouping sets ((a), (b)) format Null;
