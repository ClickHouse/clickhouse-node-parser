SELECT *
FROM (
        SELECT
            if(isValidUTF8(`1`), NULL, 'error!') AS error_message,
            if(isNull(error_message), 1, 0) AS valid
        FROM testdata
    )
WHERE valid;

SELECT *
FROM (
        SELECT 'str' AS `1`
    )
WHERE 1;