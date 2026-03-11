SELECT count()
FROM t_fill_arrays
WHERE NOT ignore(arrCol, mapCol.values);