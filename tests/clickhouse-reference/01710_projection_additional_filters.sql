SELECT count(), min(a), max(a) FROM t SETTINGS additional_table_filters = {'t' : '0'};
select count() from atf_p settings additional_table_filters = {'atf_p': 'x <= 2'};
