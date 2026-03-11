SELECT * FROM t_update_empty_nested FORMAT Null;
SELECT sum(length(nested.arr1)), sum(length(nested.arr2)) FROM t_update_empty_nested;
