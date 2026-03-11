SELECT getSubcolumn([1, 2, 3], 'size0');

SELECT getSubcolumn([1, 2, 3], materialize('size0'));

SELECT getSubcolumn([1, 2, 3], 'aaa');