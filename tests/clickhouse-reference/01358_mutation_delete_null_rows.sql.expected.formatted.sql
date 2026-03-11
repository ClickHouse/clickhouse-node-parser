SELECT '--------';

SELECT
    arrayJoin([0, 1, 3, NULL]) AS x,
    x = 0,
    if(x = 0, 'x=0', 'x<>0')
ORDER BY x ASC;

SELECT
    *,
    UserID = 0 AS UserIDEquals0,
    if(UserID = 0, 'delete', 'leave') AS verdict
FROM mutation_delete_null_rows
ORDER BY EventDate ASC;

SELECT *
FROM mutation_delete_null_rows
ORDER BY EventDate ASC;