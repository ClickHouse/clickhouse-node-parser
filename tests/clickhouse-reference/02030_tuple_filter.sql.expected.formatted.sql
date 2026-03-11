SELECT *
FROM test_tuple_filter
WHERE (id, value) = (1, 'A');

SELECT *
FROM test_tuple_filter
WHERE (1, 'A') = (id, value);

SELECT *
FROM test_tuple_filter
WHERE (id, value) = (1, 'A')
    AND (id, log_date) = (1, '2021-01-01');

SELECT *
FROM test_tuple_filter
WHERE ((id, value), id * 2) = ((1, 'A'), 2);

SELECT *
FROM test_tuple_filter
WHERE ((id, value), log_date) = ((1, 'A'), '2021-01-01');

SELECT *
FROM test_tuple_filter
WHERE (id, value, value||'foo') = ('1', 'A', 'A');

SELECT *
FROM test_tuple_filter
WHERE (1, (1, (1, (1, (id, value))))) = (1, (1, (1, (1, (1, 'A')))));

SELECT *
FROM test_tuple_filter
WHERE (1, value) = (id, 'A');

SELECT *
FROM test_tuple_filter
WHERE (1, (1, (1, (1, tuple(id))))) = (1, (1, (1, (1, tuple(1)))));

SELECT *
FROM test_tuple_filter
WHERE ((id, value), tuple(log_date)) = ((1, 'A'), tuple('2021-01-01'));

SELECT *
FROM test_tuple_filter
WHERE (log_date, value) = ('2021-01-01', 'A');

SELECT *
FROM test_tuple_filter
WHERE tuple(id) = tuple(1);

SELECT *
FROM test_tuple_filter
WHERE (id, (id, id) = (1, NULL)) == (NULL, NULL);

SELECT *
FROM test_tuple_filter
WHERE (log_date, value) = tuple('2021-01-01');

SELECT *
FROM test_tuple_filter
WHERE (id, value) = tuple(1);

SELECT *
FROM test_tuple_filter
WHERE tuple(id, value) = tuple(value, id);

SELECT *
FROM test_tuple_filter
WHERE equals((id, value));