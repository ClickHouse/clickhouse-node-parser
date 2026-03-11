SELECT
    k,
    sumMerge(d)
FROM agg_func_col
GROUP BY k
ORDER BY k ASC;

SELECT
    k,
    sumMerge(d),
    avgMerge(af_avg1)
FROM agg_func_col
GROUP BY k
ORDER BY k ASC;

SELECT
    k,
    sumMerge(d),
    avgMerge(af_avg1),
    groupUniqArrayMerge(af_gua)
FROM agg_func_col
GROUP BY k
ORDER BY k ASC;

SELECT arrayReduce('groupUniqArrayIf', ['---', '---', 't1'], [1, 1, 0]);

SELECT arrayReduce('groupUniqArrayMergeIf', [arrayReduce('groupUniqArrayState', ['---', '---']), arrayReduce('groupUniqArrayState', ['t1', 't'])], [1, 0]);

SELECT arrayReduce('avgState', [0]) IN (arrayReduce('avgState', [0, 1]), arrayReduce('avgState', [0]));

SELECT arrayReduce('avgState', [0]) IN (arrayReduce('avgState', [0, 1]), arrayReduce('avgState', [1]));

SELECT arrayReduce('uniqExactMerge', [arrayReduce('uniqExactMergeState',
        [
            arrayReduce('uniqExactState', [12345678901]),
            arrayReduce('uniqExactState', [12345678901])
        ])
    ]);

SELECT arrayReduce('uniqExactMerge', [arrayReduce('uniqExactMergeState',
        [
            arrayReduce('uniqExactState', [12345678901]),
            arrayReduce('uniqExactState', [12345678902])
        ])
    ]);