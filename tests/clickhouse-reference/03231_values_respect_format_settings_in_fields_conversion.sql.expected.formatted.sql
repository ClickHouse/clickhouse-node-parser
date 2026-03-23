SYSTEM drop  table if exists test;

CREATE TABLE test
(
    map Map(String, DateTime)
)
ENGINE = Memory;

SET date_time_input_format = 'best_effort';

INSERT INTO test;

SELECT *
FROM test;

SYSTEM drop  table test;