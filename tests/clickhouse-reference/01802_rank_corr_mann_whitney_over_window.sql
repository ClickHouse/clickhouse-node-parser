CREATE TABLE 01802_empsalary
(
    `depname` LowCardinality(String),
    `empno` UInt64,
    `salary` Int32,
    `enroll_date` Date
)
ENGINE = MergeTree
ORDER BY enroll_date
SETTINGS index_granularity = 8192;
SELECT mannWhitneyUTest(salary, salary) OVER (ORDER BY salary ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS func FROM 01802_empsalary; -- {serverError BAD_ARGUMENTS}
