SELECT hex(groupConcatMerge(',', 10)(state))
FROM (
        SELECT CAST(unhex('01580180808080108A80808010'), 'AggregateFunction(groupConcat('','', 10), String)') AS state
    );

SELECT hex(groupConcatMerge(',', 10)(state))
FROM (
        SELECT CAST(unhex('0141010100'), 'AggregateFunction(groupConcat('','', 10), String)') AS state
    );