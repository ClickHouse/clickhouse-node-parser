SELECT count()
FROM (
        SELECT DISTINCT
            nowInBlock(),
            nowInBlock('Pacific/Pitcairn')
        FROM `system`.numbers
        LIMIT 2
    );

SELECT nowInBlock(1); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT isNull(nowInBlock(NULL));

SELECT nowInBlock('UTC', 'UTC'); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }