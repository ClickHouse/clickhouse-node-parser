SELECT *
FROM set_index_not
WHERE status != 'rip';

SELECT *
FROM set_index_not
WHERE NOT status = 'rip';

SELECT *
FROM set_index_not
WHERE NOT status != 'rip';

SELECT *
FROM set_index_not
WHERE NOT NOT status = 'rip';