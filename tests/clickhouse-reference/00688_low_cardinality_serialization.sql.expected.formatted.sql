SELECT
    toTypeName(dict),
    dict,
    lowCardinalityIndices(dict),
    lowCardinalityKeys(dict)
FROM (
        SELECT concat('123_', toLowCardinality(v)) AS dict
        FROM (
                SELECT arrayJoin(['a', 'bb', '', 'a', 'ccc', 'a', 'bb', '', 'dddd']) AS v
            )
    );

SELECT
    toTypeName(dict),
    dict,
    lowCardinalityIndices(dict),
    lowCardinalityKeys(dict)
FROM (
        SELECT concat('123_', toLowCardinality(v)) AS dict
        FROM (
                SELECT arrayJoin(['a', Null, 'bb', '', 'a', Null, 'ccc', 'a', 'bb', '', 'dddd']) AS v
            )
    );

CREATE TABLE lc_small_dict
(
    str LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY str
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE lc_big_dict
(
    str LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY str
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT sum(toUInt64OrZero(str))
FROM lc_small_dict;

SELECT sum(toUInt64OrZero(str))
FROM lc_big_dict;