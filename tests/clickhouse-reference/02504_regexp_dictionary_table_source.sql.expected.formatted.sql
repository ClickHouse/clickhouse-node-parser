SELECT *
FROM dictionary(regexp_dict1);

SELECT dictGet('regexp_dict1', ('name', 'version', 'comment'), 'Linux/101.tlinux');

SELECT dictGet('regexp_dict1', ('name', 'version', 'comment'), '33/tclwebkit11.10x');

SELECT dictGet('regexp_dict1', ('name', 'version', 'comment'), '30/tclwebkit');

SELECT dictGetOrDefault('regexp_dict1', ('name', 'version', 'comment'), '30/tclwebkit', ('', 0, 'default'));

SELECT *
FROM needle_table;

SELECT dictGet(regexp_dict1, ('name', 'version'), key)
FROM needle_table;

SELECT dictGet(regexp_dict1, ('name', 'version', 'comment'), '33/tclwebkit');