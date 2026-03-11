SELECT
    count(),
    min(x),
    max(x),
    sum(x),
    uniqExact(x)
FROM modify_sample SAMPLE 0.1;

SELECT
    count(),
    min(x),
    max(x),
    sum(x),
    uniqExact(x)
FROM modify_sample_replicated SAMPLE 0.1;

SELECT
    count(),
    min(y),
    max(y),
    sum(y),
    uniqExact(y)
FROM modify_sample_replicated SAMPLE 0.1;