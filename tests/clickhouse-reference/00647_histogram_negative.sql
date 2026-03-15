create table histogram(num Int64) engine=TinyLog;
select histogram(2)(num) from histogram;
