SELECT
    l.id,
    l.name,
    r.val
FROM
    t_left AS l
LEFT JOIN t_right AS r
    ON l.id = r.id;

SELECT '--';

SELECT
    l.id,
    l.name,
    r.val
FROM
    t_left AS l
INNER JOIN t_right AS r
    ON l.id = r.id
ORDER BY l.id ASC;

SELECT
    l.id,
    l.name,
    r.val
FROM
    t_left AS l
LEFT JOIN t_right AS r
    ON l.id = r.id
ORDER BY l.id ASC;