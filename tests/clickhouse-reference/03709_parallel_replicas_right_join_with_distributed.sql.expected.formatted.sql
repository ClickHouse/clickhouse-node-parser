SELECT count()
FROM
    local_table_l AS l
RIGHT JOIN dis_table_r AS r
    ON l.c = r.c;