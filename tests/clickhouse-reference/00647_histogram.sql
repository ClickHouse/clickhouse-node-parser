select histogram(5)(number-10) from (select * from system.numbers limit 20);
select histogram(5)(number) from (select * from system.numbers limit 20);
SELECT histogram(10)(-2);
select histogramIf(3)(number, number > 11) from (select * from system.numbers limit 10);
