SELECT sum(user_id * _sample_factor)
FROM sessions SAMPLE 10000000;

SELECT
    uniq(user_id) AS a,
    min(_sample_factor) AS x,
    a * x
FROM sessions SAMPLE 10000000;