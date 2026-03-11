SELECT uniq(d.val)
FROM
    dist_table AS d
LEFT JOIN numbers(100) AS t
    USING (id);

SELECT uniq(d.val)
FROM
    dist_table AS d
LEFT JOIN local_table AS t
    USING (id);