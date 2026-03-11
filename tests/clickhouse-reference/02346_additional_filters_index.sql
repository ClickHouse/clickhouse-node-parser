select * from table_1 order by x settings additional_table_filters={'table_1' : 'x > 3'};
select * from table_1 order by x settings additional_table_filters={'table_1' : 'x < 3'};
select * from table_1 order by x settings additional_table_filters={'table_1' : 'length(y) >= 3'};
select * from table_1 order by x settings additional_table_filters={'table_1' : 'length(y) < 3'};
select * from distr_table order by x settings additional_table_filters={'distr_table' : 'x > 3'};
select * from distr_table order by x settings additional_table_filters={'distr_table' : 'x < 3'};
select * from distr_table order by x settings additional_table_filters={'distr_table' : 'length(y) > 3'};
select * from distr_table order by x settings additional_table_filters={'distr_table' : 'length(y) < 3'};
