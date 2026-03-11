SELECT (
        SELECT eventTimestamp
        FROM datDictionary
    );

SELECT count(*)
FROM dat
WHERE eventTimestamp >= (
        SELECT eventTimestamp
        FROM datDictionary
    );