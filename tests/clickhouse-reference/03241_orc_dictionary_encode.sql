-- Tags: no-fasttest
set input_format_orc_use_fast_decoder = 1;
set input_format_orc_dictionary_as_low_cardinality = 1;
select c, count(1) from file(concat(currentDatabase(), '_03241_data1_without_dict.orc')) group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data1_with_dict.orc')) group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data1_without_dict.orc'), ORC, 'c String') group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data1_with_dict.orc'), ORC, 'c LowCardinality(String)') group by c order by c;
set input_format_orc_dictionary_as_low_cardinality = 0;
select c, count(1) from file(concat(currentDatabase(), '_03241_data2_without_dict.orc')) group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data2_with_dict.orc')) group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data2_without_dict.orc'), ORC, 'c String') group by c order by c;
select c, count(1) from file(concat(currentDatabase(), '_03241_data2_with_dict.orc'), ORC, 'c LowCardinality(String)') group by c order by c;
