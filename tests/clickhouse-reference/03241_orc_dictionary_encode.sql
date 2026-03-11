select c, count(1) from file(concat(currentDatabase(), '_03241_data1_without_dict.orc')) group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data1_with_dict.orc')) group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data1_without_dict.orc'), ORC, 'c String') group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data1_with_dict.orc'), ORC, 'c LowCardinality(String)') group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data2_without_dict.orc')) group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data2_with_dict.orc')) group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data2_without_dict.orc'), ORC, 'c String') group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data2_with_dict.orc'), ORC, 'c LowCardinality(String)') group by c order by c;
