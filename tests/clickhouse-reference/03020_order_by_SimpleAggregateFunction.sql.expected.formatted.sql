SET allow_suspicious_primary_key = 0;

CREATE TABLE data
(
    key Int,
    value AggregateFunction(sum, UInt64)
)
ENGINE = AggregatingMergeTree()
ORDER BY (key, value); -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }

CREATE TABLE data
(
    key Int,
    value SimpleAggregateFunction(sum, UInt64)
)
ENGINE = AggregatingMergeTree()
ORDER BY (key, value); -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }

CREATE TABLE data
(
    key Int,
    value AggregateFunction(sum, UInt64)
)
ENGINE = AggregatingMergeTree()
PRIMARY KEY value; -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }

CREATE TABLE data
(
    key Int,
    value SimpleAggregateFunction(sum, UInt64)
)
ENGINE = AggregatingMergeTree()
PRIMARY KEY value; -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }

CREATE TABLE data
(
    key Int,
    value AggregateFunction(sum, UInt64)
)
ENGINE = AggregatingMergeTree()
ORDER BY (value, key)
PRIMARY KEY value; -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }

CREATE TABLE data
(
    key Int,
    value SimpleAggregateFunction(sum, UInt64)
)
ENGINE = AggregatingMergeTree()
ORDER BY (value, key)
PRIMARY KEY value; -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }

SET allow_suspicious_primary_key = 1;

-- ALTER AggregatingMergeTree
CREATE TABLE data
(
    key Int
)
ENGINE = AggregatingMergeTree()
ORDER BY key;

-- ALTER ReplicatedAggregatingMergeTree
CREATE TABLE data_rep
(
    key Int
)
ENGINE = ReplicatedAggregatingMergeTree('/tables/{database}', 'r1')
ORDER BY key;