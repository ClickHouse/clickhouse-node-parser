select * from dictionary(regexp_dict1);
select dictGet('regexp_dict1', ('name', 'version', 'comment'), 'Linux/101.tlinux');
select dictGet('regexp_dict1', ('name', 'version', 'comment'), '33/tclwebkit11.10x');
select dictGet('regexp_dict1', ('name', 'version', 'comment'), '30/tclwebkit');
select dictGetOrDefault('regexp_dict1', ('name', 'version', 'comment'), '30/tclwebkit', ('', 0, 'default'));
select * from needle_table;
select dictGet(regexp_dict1, ('name', 'version'), key) from needle_table;
select dictGet(regexp_dict1, ('name', 'version', 'comment'), '33/tclwebkit');
