SELECT DISTINCT meta_source_req_uuid
FROM bug_14144
WHERE meta_source_type = 'missing'
ORDER BY meta_source_req_uuid ASC;

SELECT COUNT()
FROM (
        SELECT DISTINCT meta_source_req_uuid
        FROM bug_14144
        WHERE meta_source_type = 'missing'
        ORDER BY meta_source_req_uuid ASC
        LIMIT 100000
    );