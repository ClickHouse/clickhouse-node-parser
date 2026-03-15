CREATE TABLE sessions
(
  `user_id` UInt64
)
ENGINE = MergeTree
ORDER BY user_id 
SAMPLE BY user_id;
SELECT
    sum(user_id * _sample_factor) 
FROM sessions
SAMPLE 10000000;
SELECT
    uniq(user_id) a,  min(_sample_factor) x,  a*x
FROM sessions
SAMPLE 10000000;
