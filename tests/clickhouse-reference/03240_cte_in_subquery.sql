SELECT max(date_out)
FROM
(
    WITH
        (
            SELECT max(date)
            FROM subquery_cte_in 
            WHERE (id = 6) AND (label = 2)
        ) AS cte_1,
        (
            SELECT max(date)
            FROM subquery_cte_in 
            WHERE (id = 10) AND (label = 2)
        ) AS cte_2
    SELECT date AS date_out
    FROM subquery_cte_in
    WHERE date IN (cte_1, cte_2)
);
