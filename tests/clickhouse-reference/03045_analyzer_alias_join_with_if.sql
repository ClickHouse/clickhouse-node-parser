SELECT
    b.name name,
    a.a_col a_col,
    b.b_col b_col,
    'N' some_val
from test_a_table a
join test_b_table b on a.name = b.name
where b.some_val = 'Y';
SELECT
    b.name name,
    a.a_col a_col,
    b.b_col b_col,
    if(1,'N',b.some_val) some_val
from test_a_table a
join test_b_table b on a.name = b.name
where b.some_val = 'Y';
