CREATE TABLE test
(
    map Map(String, DateTime)
)
ENGINE = Memory;

SET date_time_input_format = 'best_effort';

SELECT *
FROM test;