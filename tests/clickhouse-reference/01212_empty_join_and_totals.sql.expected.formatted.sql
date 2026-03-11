SELECT *
FROM
    `system`.one AS t1
INNER JOIN `system`.one AS t2
    ON t1.dummy = t2.dummy
LIMIT 0
FORMAT TabSeparated;

SELECT *
FROM
    `system`.one AS t1
INNER JOIN `system`.one AS t2
    ON t1.dummy = t2.dummy
WHERE t2.dummy > 0
FORMAT TabSeparated;