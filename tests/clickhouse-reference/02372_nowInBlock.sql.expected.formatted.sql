SELECT count()
FROM (
        SELECT DISTINCT
            nowInBlock(),
            nowInBlock('Pacific/Pitcairn')
        FROM `system`.numbers
        LIMIT 2
    );

SELECT nowInBlock(1);

SELECT isNull(nowInBlock(NULL));

SELECT nowInBlock('UTC', 'UTC');