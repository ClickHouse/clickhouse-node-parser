SELECT
    finalizeAggregation(uniqThetaUnion(a, b)),
    finalizeAggregation(a),
    finalizeAggregation(b)
FROM (
        SELECT
            arrayReduce('uniqThetaState', []) AS a,
            arrayReduce('uniqThetaState', []) AS b
    );

SELECT
    finalizeAggregation(uniqThetaUnion(a, b)),
    finalizeAggregation(a),
    finalizeAggregation(b)
FROM (
        SELECT
            arrayReduce('uniqThetaState', [1,2]) AS a,
            arrayReduce('uniqThetaState', [2,3,4]) AS b
    );

SELECT
    finalizeAggregation(uniqThetaUnion(a, b)),
    finalizeAggregation(a),
    finalizeAggregation(b)
FROM (
        SELECT
            arrayReduce('uniqThetaState', [2,3,4]) AS a,
            arrayReduce('uniqThetaState', [1,2]) AS b
    );

SELECT
    finalizeAggregation(uniqThetaIntersect(a, b)),
    finalizeAggregation(a),
    finalizeAggregation(b)
FROM (
        SELECT
            arrayReduce('uniqThetaState', []) AS a,
            arrayReduce('uniqThetaState', []) AS b
    );

SELECT
    finalizeAggregation(uniqThetaIntersect(a, b)),
    finalizeAggregation(a),
    finalizeAggregation(b)
FROM (
        SELECT
            arrayReduce('uniqThetaState', [1,2]) AS a,
            arrayReduce('uniqThetaState', [2,3,4]) AS b
    );

SELECT
    finalizeAggregation(uniqThetaIntersect(a, b)),
    finalizeAggregation(a),
    finalizeAggregation(b)
FROM (
        SELECT
            arrayReduce('uniqThetaState', [2,3,4]) AS a,
            arrayReduce('uniqThetaState', [1,2]) AS b
    );

SELECT
    finalizeAggregation(uniqThetaNot(a, b)),
    finalizeAggregation(a),
    finalizeAggregation(b)
FROM (
        SELECT
            arrayReduce('uniqThetaState', []) AS a,
            arrayReduce('uniqThetaState', []) AS b
    );

SELECT
    finalizeAggregation(uniqThetaNot(a, b)),
    finalizeAggregation(a),
    finalizeAggregation(b)
FROM (
        SELECT
            arrayReduce('uniqThetaState', [1,2]) AS a,
            arrayReduce('uniqThetaState', [2,3,4]) AS b
    );

SELECT
    finalizeAggregation(uniqThetaNot(a, b)),
    finalizeAggregation(a),
    finalizeAggregation(b)
FROM (
        SELECT
            arrayReduce('uniqThetaState', [2,3,4]) AS a,
            arrayReduce('uniqThetaState', [1,2]) AS b
    );

SELECT
    finalizeAggregation(uniqThetaIntersect(a, b)),
    finalizeAggregation(a),
    finalizeAggregation(b)
FROM (
        SELECT
            (uniqThetaStateIf(number, number > 0)) AS a,
            (uniqThetaStateIf(number, number > 5)) AS b
        FROM (
                SELECT number
                FROM `system`.numbers
                LIMIT 10
            )
    );

CREATE TABLE test1
(
    year String,
    uv AggregateFunction(uniqTheta, Int64)
)
ENGINE = AggregatingMergeTree()
ORDER BY year;

SELECT
    finalizeAggregation(uniqThetaIntersect(uv2021, uv2022)) / finalizeAggregation(uv2021),
    finalizeAggregation(uniqThetaIntersect(uv2021, uv2022)),
    finalizeAggregation(uv2021)
FROM (
        SELECT
            uniqThetaMergeStateIf(uv, year = '2021') AS uv2021,
            uniqThetaMergeStateIf(uv, year = '2022') AS uv2022
        FROM test1
    );

CREATE TABLE test2
(
    year String,
    uv Int64
)
ENGINE = MergeTree()
ORDER BY year;

SELECT
    finalizeAggregation(uniqThetaIntersect(uv2021, uv2022)) / finalizeAggregation(uv2021),
    finalizeAggregation(uniqThetaIntersect(uv2021, uv2022)),
    finalizeAggregation(uv2021)
FROM (
        SELECT
            uniqThetaStateIf(uv, year = '2021') AS uv2021,
            uniqThetaStateIf(uv, year = '2022') AS uv2022
        FROM test2
    );