SYSTEM drop  temporary table if exists test_00670;

CREATE TEMPORARY TABLE test_00670
(
    id int
);

INSERT INTO test_00670;

SELECT *
FROM test_00670;

SYSTEM drop  temporary table test_00670;