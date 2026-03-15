SET allow_suspicious_ttl_expressions = 1;
create table alter_ttl(i Int) engine = MergeTree order by i ttl toDate('2020-05-05');
create table alter_ttl(d Date, s String) engine = MergeTree order by d ttl d + interval 1 month;
