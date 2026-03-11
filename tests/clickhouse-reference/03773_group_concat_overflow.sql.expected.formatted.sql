SELECT hex(groupConcatMerge(',', 10)(state))
FROM (
        SELECT CAST(unhex('044141414180808080808080808001'), 'AggregateFunction(groupConcat('','', 10), String)') AS state
    );